class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create, :forgot_password, :request_password, :change_password, :reset_password, :pending]
  before_action :set_user, only: [:show, :edit, :update, :destroy, :add_admin_rights, :remove_admin_rights, :approve_user, :reject_user]
  before_action :set_user_by_email, only: [:change_password]
  # might be unsafe to include get function reset_password
  before_action :create_session_by_auth_email, only: [:pending]
  before_action :require_admin, only: [:index, :pending, :approved, :denied, :inactive, :admin, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/pending
  # Pending means not approved or denied
  def pending 
    @pending_users = User.where(isApproved:false).where(isDenied:false).paginate(:page => params[:pending_users_page], :per_page => 10)
  end

  # GET /users/approved
  # Already approved but might need to promote to admin/deactivate
  def approved
    @approved_users = User.where(isApproved:true).where(isDenied:false).paginate(:page => params[:uapproved_users_page], :per_page => 10)
  end

  # GET /users/denied
  # Already denied but might need to approve
  def denied
    @denied_users = User.where(isDenied:true).where(isApproved:false).paginate(:page => params[:denied_users_page], :per_page => 10)
  end

  # GET /users/inactive
  # Already inactive but might need to activate
  def inactive
    @inactive_users = User.where(isActive:false).paginate(:page => params[:inactive_users_page], :per_page => 10)
  end

  # GET /users/admin
  # Manage all admin users/remove admin rights
  def admin
    @admin_users = User.where(isAdmin:true).where(isApproved:true).paginate(:page => params[:admin_users_page], :per_page => 10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/home
  def home
    # Get all active studies (for filter)
    get_active_studies()

    # Recently Contacted Participants:
    get_recently_contacted_participants()

    # Upcoming Notifications (This Week)
    get_upcoming_notifications() 

    # Your Recent Notes:
    get_recent_notes_from_user()

  end

  # GET /users/new
  def new
    if Team.none?
      redirect_to new_team_path, notice: 'No team exists. You need at least one to begin.'
    end
    @user = User.new
  end

  def forgot_password
    @errors = []
  end

  def request_password
    @errors = []
    if @user
      UserMailer.password_reset(@user).deliver
      redirect_to forgot_password_path, notice: 'Instructions sent by email'
    else
      @errors << "Invalid Email"
      render :forgot_password
    end

  end

  def reset_password
    @errors = []
  end

  def change_password
    @errors = []

    if @user
      if params[:password] == params[:password_confirmation]
        @user.password = params[:password]
        if  Digest::MD5.hexdigest(@user.email) == params[:token] 
          if @user.save
            @current_user = @user
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'Password successfully updated.'
          else
            @errors << "Something went wrong"
            render :reset_password
          end
        else
          @errors << "Invalid Recovery Token"
          render :reset_password
        end
      else
        @errors << "Passwords don't match"
        render :reset_password
      end
    else
      @errors << "Invalid Email"
      render :reset_password
    end
  end

  # GET /users/1/edit
  def edit
    redirect_to user_path(@user.id), notice: 'You are not authorized to make modifications to this user.' unless (@current_user.isAdmin?) || (@current_user.id == @user.id)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.new_user_registration_email
        format.html { redirect_to login_path, notice: 'User was successfully created. Please see email for Instructions.'
                    }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'Fix the errors.'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_home_path(@current_user), notice: 'User (' + @user.full_name + ') was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /users/1
  def activate
    set_user_isActive(true)
  end

  # PATCH/PUT /users/1
  def deactivate
    set_user_isActive(false)
  end

  # PATCH/PUT /users/1
  def add_admin_rights
    set_admin_rights(true)
  end

  # PATCH/PUT /users/1
  def remove_admin_rights
    set_admin_rights(false)
  end

  # PATCH/PUT /users/1
  def approve_user
    @errors = []
    if @user
      @user.isActive = true
      @user.isApproved = true
      @user.isDenied = false  
      if @user.save
        UserMailer.registration_approved(@user,@current_user.email).deliver
        redirect_to pending_users_path, notice: 'User has been approved.'
      else
        redirect_to pending_users_path, notice: 'Something went wrong.'
      end
    else
      redirect_to pending_users_path, notice: 'Invalid Email.'
    end
  end

  # PATCH/PUT /users/1
  def reject_user
    @errors = []
    if @user
      @user.isActive = true
      @user.isApproved = false
      @user.isDenied = true 
      if @user.save
        UserMailer.registration_denied(@user,@current_user.email).deliver
        redirect_to pending_users_path, notice: 'User has been denied access.'
      else
        redirect_to pending_users_path, notice: 'Something went wrong.'
      end
    else
      redirect_to pending_users_path, notice: 'Invalid Email/User.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id].present?
        @user = User.find(params[:id])
      end
    end

    def set_current_user_by_email
      @user = User.where(email: params[:email]).where(isActive: true).first
      if @user.nil?
        redirect_to root_path, notice: "That email is either invalid or deactivated. Contact your admins."
      else
        # this is for the instance of get_password where a user is signed in but changing passwords.
        @current_user = @user
      end
    end

    def set_user_by_email
      @user = User.where(email: params[:email]).where(isActive: true).first
      if @user.nil?
        redirect_to root_path, notice: "That email is either invalid or deactivated. Contact your admins."
      end
    end

    def set_user_isActive(isActive)
      @errors = []
      if @user
        @user.isActive = isActive
        toggle_notice = (@user.isActive)? ("User is now active.") : ("User deactivated.")
        if @user.save
          # UserMailer.approve_account(@user).deliver
          # Send email to notify user that he is now active or not.
          redirect_to inactive_users_path, notice: toggle_notice
        else
          redirect_to inactive_users_path, notice: 'Something went wrong. Email not sent'
        end
      else
        redirect_to inactive_users_path, notice: 'Invalid Email/User.'
      end
    end

    def set_admin_rights(isAdmin)
      @errors = []
      if @user
        @user.isAdmin = isAdmin 
        toggle_notice = (@user.isAdmin)? ("User is now admin.") : ("Admin rights revoked.")
        if @user.save
          # UserMailer.approve_account(@user).deliver
          # Send email to notify user that he is now admin.
          redirect_to pending_users_path, notice: toggle_notice
        else
          redirect_to pending_users_path, notice: 'Something went wrong. Email not sent'
        end
      else
        redirect_to pending_users_path, notice: 'Invalid Email/User.'
      end
    end

    def get_recently_contacted_participants
      if params[:filter_participants_by_study].blank? # All Studies
        study_filter = 0
      else
        study_filter = params[:filter_participants_by_study][:filter_participants_by_study_val]
      end
      if params[:search].nil? || params[:search].blank?
        if study_filter.present? && study_filter != 0 # Study Selected
          @search_participants = @current_user.participants.recently_contacted.where(study_id: study_filter)
        else # All Studies
          @search_participants = @current_user.participants.recently_contacted
        end
        @search_or_recent_header = 'Recently Contacted Participants:'
        @if_empty_string = 'No Participants Contacted Yet.'   
      else
        if study_filter.present? && study_filter != 0 # Study Selected
          @search_participants = Participant.where(params[:field_to_search] + " LIKE '%#{params[:search]}%'").where(study_id: study_filter)
        else # All Studies
          @search_participants = Participant.where(params[:field_to_search] + " LIKE '%#{params[:search]}%'")
        end
        @search_or_recent_header = 'Found ' + @search_participants.count.to_s + ' Participants'
        @if_empty_string = 'No Participants found in Search.'
      end
      if @search_participants.empty?
        @search_or_recent_header = @if_empty_string
      end
    
      @search_participants = @search_participants.paginate(:page => params[:search_participants_page], :per_page => 10)
    end

    def get_upcoming_notifications
      @upcoming_notes_notification = @current_user.notes.upcoming_notifications_this_fortnight.paginate(:page => params[:upcoming_notes_notification_page], :per_page => 10)

      if @upcoming_notes_notification.empty?
        @upcoming_notes_notification_header = "No Notifications This Fortnight! Yay!"
      else
        @upcoming_notes_notification_header = "Upcoming Notifications (This Fortnight):"
      end

      #get_upcoming_major_team_notifications

      #@upcoming_notes_notification = @upcoming_major_team_notifications.paginate(:page => params[:upcoming_notes_notification_page], :per_page => 10)

      get_upcoming_users_notifications_and_major_team_notifications

      @upcoming_notes_notification = @upcoming_users_notifications_and_major_team_notification.paginate(:page => params[:upcoming_notes_notification_page], :per_page => 10)
    end

    def get_recent_notes_from_user
      @recent_notes_from_user = @current_user.notes.recent_ten.paginate(:page => params[:recent_notes_from_user_page])
      if @recent_notes_from_user.empty?
        @recent_notes_from_user_header = "No Notes From User Yet!"
      else
        @recent_notes_from_user_header = 'Recent Notes From ' + @current_user.full_name + ':'
      end 
    end

    def get_upcoming_major_team_notifications
      @upcoming_major_team_notifications = Note.where(user_id: @current_user.team.users.select(:id)).upcoming_notifications_this_fortnight.major.paginate(:page => params[:upcoming_major_notification_page], :per_page => 10)

      if (@upcoming_major_team_notifications.nil? || @upcoming_major_team_notifications.empty?)
          @upcoming_notes_notification_header = "No Notifications This Fortnight! Yay!"
      else
          @upcoming_notes_notification_header = "Upcoming Major Notifications (This Fortnight):"
      end
    end

    def get_upcoming_users_notifications_and_major_team_notifications
      @upcoming_users_notifications_and_major_team_notification = Note.where(user_id: @current_user.team.users.select(:id)).upcoming_notifications_this_fortnight.major.or(Note.upcoming_notifications_this_fortnight).distinct

      if (@upcoming_users_notifications_and_major_team_notification.nil? || @upcoming_users_notifications_and_major_team_notification.empty?)
          @upcoming_notes_notification_header = "No Notifications This Fortnight! Yay!"
      else
          @upcoming_notes_notification_header = "Upcoming Notifications (This Fortnight):"
      end
    end

    def get_active_studies
      @active_studies = Study.where(status: 1) # active: status = 1
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :contact_number, :team_id, :supervisor_id, :isSupervisor, :supervisorNameNotAUser, :isActive, :isAdmin, :isApproved, :isDenied, :isBlinded)
    end

end

class UsersController < ApplicationController
  before_action :set_user, only: [:home, :show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    if @users.empty?
      redirect_to new_user_path, notice: 'Create a user to begin using this app. You must be logged in to proceed.'
    else
      # if admin add redirect to users_path?
      redirect_to user_home_path User.first # This is temporary, we will get the session here.
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/1/home
  def home
    @upcoming_notes_notification = @user.notes.upcoming_notifications_this_week

    @recent_notes_from_user = @user.notes.recent_ten

    if params[:search].nil?
      @search_participants = @user.participants.recently_contacted
      @search_or_recent_header = 'Recently Contacted Participants'
      @if_empty_string = 'No Participants Contacted Yet.'   
    else
      @search_participants = Participant.search params[:search]
      @search_or_recent_header = 'Found ' + @search_participants.count.to_s + ' Participants'
      @if_empty_string = 'No Participants found in Search.'
    end
    if @search_participants.empty?
      @search_or_recent_header = @if_empty_string
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :full_name, :email, :contact_number, :team_id, :supervisor_id)
    end
end

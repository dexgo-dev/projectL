class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #private
  def current_user
      @current_user = User.find(session[:user_id]) if session[:user_id] 
  end

  def create_session_by_auth_email
    unless current_user
      user = User.where(isActive:true).where(isApproved:true).where(isDenied:false).find_by_email(params[:email])
      # If the user exists AND the password entered is correct.
      # if @user && @user.authenticate(params[:password])
      if (user && (params[:token] == Digest::MD5.hexdigest(params[:email])))
        # Save the user id inside the browser cookie. This is how we keep the user 
        # logged in when they navigate around our website.
        session[:user_id] = user.id
      else
      # If user's login doesn't work, send them back to the login form.
        redirect_to login_path, notice: 'That email auth flopped(' + params[:token] + ').' 
      end
    end
  end

  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user && session[:user_id]
  end

  def require_admin
    if current_user.nil?
      authorize
    else
      redirect_to user_home_path(current_user), notice: 'Admin only: You are not authorized to view that page.' unless current_user.isAdmin?
    end
  end

  def is_admin_or_member_of_team
    unless current_user.nil?
    	unless current_user.isAdmin?
    		redirect_to user_home_path(current_user), notice: 'Admin only: You are not authorized to view team information for teams you\'re not a member of.' unless (current_user.team_id == @team.id)
    	end
    end
  end

  private

    def get_admin_stats
      #if current_user.isAdmin?
        # Get count for users pending approval
        #@pending_users_count = User.where(isApproved:false).where(isDenied:false).count
      #end
    end

end

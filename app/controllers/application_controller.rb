class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #private
  def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_path unless current_user && session[:user_id]
  end

  def require_admin
  	redirect_to user_home_path(current_user), notice: 'Admin only: You are not authorized to view that page.' unless current_user.isAdmin?
  end

  def is_admin_or_member_of_team
  	unless current_user.isAdmin?
  		redirect_to user_home_path(current_user), notice: 'Admin only: You are not authorized to view team information for teams you\'re not a member of.' unless (current_user.team_id == @team.id)
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

class SessionsController < ApplicationController

  def index
    redirect_to '/', notice: 'You have been logged out.' 
  end

  def new

  end

	def create
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    # if @user && @user.authenticate(params[:password])
    if (user && (user.password == params[:password]))
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login', notice: 'Your username or password was incorrect.' 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'You have logged out.' 
  end
end

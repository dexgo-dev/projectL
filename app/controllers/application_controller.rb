class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #private
  def application_current_user
      @_current_user = User.last
  end
end

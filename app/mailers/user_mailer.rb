class UserMailer < ApplicationMailer
  def new_registration_email_for_user(new_user)
  	@new_user = new_user
    mail to: @new_user.email, subject: '[Loggr] You have signed up for Loggr!'
  end
  def new_registration_email_for_admins(new_user,admin_email)
  	@new_user = new_user
    @pending_approval_url = pending_users_url  +  "?token=" + Digest::MD5.hexdigest(admin_email) + "&email=" + admin_email
    mail to: admin_email, subject: '[Loggr] ' + @new_user.full_name + ' has signed up.', reply_to: @new_user.email
  end
  def registration_denied(new_user,admin_email)
  	@new_user = new_user
    @admin_email = admin_email
    mail to: @new_user.email, subject: '[Loggr] Your access request has been denied.', reply_to: @admin_email
    #redirect_to pending_users_path, notice: 'User rejected. Email dispatched.'
  end
  def registration_approved(new_user,admin_email)
  	@new_user = new_user
    @url  = login_url +  "?email=" + @new_user.email
    mail to: @new_user.email, subject: '[Loggr] Your access request has been granted.', reply_to: admin_email
    #redirect_to pending_users_url, notice: 'User approved. Email dispatched.'
  end
  def password_reset(forgetful_user)
  	@forgetful_user = forgetful_user
    @url  = reset_password_url +  "?token=" + Digest::MD5.hexdigest(forgetful_user.email) + "&email=" + forgetful_user.email
    mail to: @forgetful_user.email, subject: '[Loggr] Request to reset password'
    #redirect_to login_path, notice: 'Password Reset. Log In with your new password.'
  end
end

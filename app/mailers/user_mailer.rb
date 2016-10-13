class UserMailer < ApplicationMailer
  def new_registration_email_for_user(new_user)
  	@new_user = new_user
    mail to: @new_user.email, subject: '[Loggr] You have signed up for Loggr!'
  end
  def new_registration_email_for_admins(new_user,admin_email)
  	@new_user = new_user
    mail to: admin_email, subject: '[Loggr] ' + @new_user.full_name + ' has signed up.', reply_to: @new_user.email
  end
  def registration_denied(new_user,admin_email)
  	@new_user = new_user
    mail to: @new_user.email, subject: '[Loggr] Your access request has been denied.', reply_to: admin_email
  end
  def registration_approved(new_user,admin_email)
  	@new_user = new_user
    mail to: @new_user.email, subject: '[Loggr] Your access request has been granted.', reply_to: admin_email
  end
  def password_reset(forgetful_user)
  	@forgetful_user = forgetful_user
    mail to: @forgetful_user.email, subject: '[Loggr] Request to reset password'
  end
end

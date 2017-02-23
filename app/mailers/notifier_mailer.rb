class NotifierMailer < ApplicationMailer
  default from: "no-reply@neura.edu.au"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.note_notifier.subject
  #
  def note_notifier(note)
    @logger_note = note
    @user = @logger_note.user
    @participant = @logger_note.participant

    # attachments['n.pdf'] = File.read("#{Rails.root}/public/note.pdf")
    mail to: @user.email, subject: 'Your note notification for participant: ' + @participant.first_name + ' ' + @participant.surname, cc: 'fbirc-dev@neura.edu.au', reply_to: 'fbirc-dev@neura.edu.au'
  end
end

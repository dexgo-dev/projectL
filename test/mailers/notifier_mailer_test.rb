require 'test_helper'

class NotifierMailerTest < ActionMailer::TestCase
  test "note_notifier" do
    mail = NotifierMailer.note_notifier
    assert_equal "Note notifier", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

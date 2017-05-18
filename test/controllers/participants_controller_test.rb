require 'test_helper'

class ParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participant = participants(:one)
  end

  test "should get index" do
    get participants_url
    assert_response :success
  end

  test "should get new" do
    get new_participant_url
    assert_response :success
  end

  test "should create participant" do
    assert_difference('Participant.count') do
      post participants_url, params: { participant: { status: @participant.status, primary_contact_number: @participant.primary_contact_number, date_of_birth: @participant.date_of_birth, email: @participant.email, gender: @participant.gender, home_address: @participant.home_address, first_name: @participant.first_name, surname: @participant.surname, study_id: @participant.study_id } }
    end

    assert_redirected_to participant_url(Participant.last)
  end

  test "should show participant" do
    get participant_url(@participant)
    assert_response :success
  end

  test "should get edit" do
    get edit_participant_url(@participant)
    assert_response :success
  end

  test "should update participant" do
    patch participant_url(@participant), params: { participant: { status: @participant.status, primary_contact_number: @participant.primary_contact_number, date_of_birth: @participant.date_of_birth, email: @participant.email, gender: @participant.gender, primary_home_address: @participant.primary_home_address, first_name: @participant.first_name, surname: @participant.surname, study_id: @participant.study_id } }
    assert_redirected_to participant_url(@participant)
  end

  test "should destroy participant" do
    assert_difference('Participant.count', -1) do
      delete participant_url(@participant)
    end

    assert_redirected_to participants_url
  end
end

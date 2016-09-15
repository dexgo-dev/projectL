class ParticipantsController < ApplicationController
  before_action :get_participant_with_id, only: [:show, :edit, :update, :destroy]

  def index
      @allparticipants = Participant.all

      # There was a bit about this in the tutorial but I don't know when I'm going to use this.
      # rendering the json file in case any other program needs it <url of this action.json>
      respond_to do |format|
          format.html
          format.json { render json: @allparticipants}
      end
  end

  def show
      # There was a bit about this in the tutorial but I don't know when I'm going to use this.
      # rendering the json file in case any other program needs it <url of this action.json>
      respond_to do |format|
          format.html
          format.json { render json: @this_participant}
      end
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def get_participant_with_id
      @this_participant = Participant.find(params[:id])
      @this_participants_notes = @this_participant.notes
  end

end

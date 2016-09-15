class NotesController < ApplicationController
  before_action :require_login

  def index
    @recent20notes = Note.find(:all, :order => "updated_at desc", :limit => 20)

    # There was a bit about this in the tutorial but I don't know when I'm going to use this.
    # rendering the json file in case any other program needs it <url of this action.json>
    respond_to do |format|
        format.html
        format.json { render json: @recent20notes}
    end
  end

  def show
      @this_note = Note.find(params[:id])
      @this_notes_logger = @this_note.user
      @this_notes_participant = @this_note.participant
  end

  def new

  end

  def edit

  end

  def update

  end

  def destroy

  end
end

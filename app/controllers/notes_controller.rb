class NotesController < ApplicationController
  before_action :get_user_from_session # authorize is done here.
  before_action :get_participant
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  after_action :set_participant_last_contact, only: [:create, :update]

  # GET /notes
  # GET /notes.json
  def index
    @all_participant_notes = @participant.notes.order("updated_at desc").paginate(:page => params[:page], :per_page => 2)
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new(user_id: @user.id)
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = @participant.notes.new(note_params)
    @note.user_id = @user.id

    respond_to do |format|
      format.js
      if @note.save
        format.html { redirect_to [@participant,@note], notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to [@participant,@note], notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to participant_path(@participant), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_user_from_session
      authorize()
      @user = @current_user
    end

    def get_participant
      @participant = Participant.find(params[:participant_id])
    end

    def set_note
      @note = Note.find(params[:id])
    end

    def set_participant_last_contact
      @participant.update(last_contacted_at: @note.updated_at, last_contacted_by: @user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      get_user_from_session()
      params.require(:note).permit(:participant_id, :note_text, :important, :notify_on, :user_id)
    end

    def participant_params
      params.require(:participant).permit(:name, :gender, :contact_number, :home_address, :active, :study_id, :date_of_birth, :email, :last_contacted_by, :last_contacted_at)
    end
end

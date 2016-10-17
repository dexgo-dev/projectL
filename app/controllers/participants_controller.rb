class ParticipantsController < ApplicationController
  before_action :authorize
  before_action :check_for_exisiting_study, except: [:index, :show, :destroy]
  before_action :set_participant, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :destroy]

  # GET /participants
  # GET /participants.json
  def index
    @participants = Participant.all.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /participants/1
  # GET /participants/1.json
  def show
    if @participant.last_contacted_by.nil?
      @last_contacted_by_name = 'No calls logged yet.'
    else
      @last_contacted_by_name = User.find(@participant.last_contacted_by).full_name
    end
    @participant_recent_notes = @participant.notes.order("updated_at desc").paginate(:page => params[:page])

  end

  # GET /participants/new
  def new
    @participant = Participant.new
  end

  # GET /participants/1/edit
  def edit
  end

  # POST /participants
  # POST /participants.json
  def create
    @participant = Participant.new(participant_params)

    respond_to do |format|
      if @participant.save
        format.html { redirect_to @participant, notice: 'Participant was successfully created.' }
        format.json { render :show, status: :created, location: @participant }
      else
        format.html { render :new }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /participants/1
  # PATCH/PUT /participants/1.json
  def update
    respond_to do |format|
      if @participant.update(participant_params)
        format.html { redirect_to @participant, notice: 'Participant was successfully updated.' }
        format.json { render :show, status: :ok, location: @participant }
      else
        format.html { render :edit }
        format.json { render json: @participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /participants/1
  # DELETE /participants/1.json
  def destroy
    @participant.destroy
    respond_to do |format|
      format.html { redirect_to participants_url, notice: 'Participant was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    def check_for_exisiting_study
      @current_studies = Study.all
      if @current_studies.empty?
        redirect_to new_study_path, notice: 'We need at least one active study to start creating participants.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def participant_params
      params.require(:participant).permit(:name, :gender, :contact_number, :home_address, :active, :study_id, :date_of_birth, :email, :last_contacted_by, :last_contacted_at)
    end
end

class CalendarsController < BaseController
  #before_action :authenticate_user!
  before_action :set_hairdresser, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_calendar, only: [:show, :edit, :update, :destroy]


  # GET /hairdressers/:hairdresser_id/calendars
  # GET /hairdressers/:hairdresser_id/calendars.json
  def index
    @calendars = @hairdresser.calendars
  end

  # GET /hairdressers/:hairdresser_id/calendars/:id
  # GET /hairdressers/:hairdresser_id/calendars/:id.json
  def show
  end

  # GET /hairdressers/:hairdresser_id/calendars/new
  def new
    @calendar = @hairdresser.calendars.new
  end

  # GET /hairdressers/:hairdresser_id/calendars/:id/edit
  def edit
  end

  # POST /hairdressers/:hairdresser_id/calendars
  # POST /hairdressers/:hairdresser_id/calendars.json
  def create
    @calendar = @hairdresser.calendars.create(calendar_params)

    respond_to do |format|
      if @calendar.save
        format.html { redirect_to hairdresser_calendar_path(@hairdresser,@calendar), notice: 'Calendar was successfully created.' }
        format.json { render :show, status: :created, location: @calendar }
      else
        format.html { render :new }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairdressers/:hairdresser_id/calendars/:id
  # PATCH/PUT /hairdressers/:hairdresser_id/calendars/:id.json
  def update
    respond_to do |format|
      if @calendar.update(calendar_params)
        format.html { redirect_to hairdresser_calendar_path(@hairdresser, @calendar), notice: 'Calendar was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar }
      else
        format.html { render :edit }
        format.json { render json: @calendar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairdressers/:hairdresser_id/calendars/:id
  # DELETE /hairdressers/:hairdresser_id/calendars/:id.json
  def destroy
    @calendar.destroy
    respond_to do |format|
      format.html { redirect_to hairdresser_calendars_path(@hairdresser), notice: 'Calendar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hairdresser
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = @hairdresser.calendars.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def calendar_params
    params.require(:calendar).permit(:day, :available, :start_time, :end_time)
  end

end

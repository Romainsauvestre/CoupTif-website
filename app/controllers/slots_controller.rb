class SlotsController < BaseController
  before_action :authenticate_user!, except: [:book] #TODO: remove
  before_action :set_hairdresser, only: [:index, :show, :new, :edit, :create, :update, :destroy, :book]
  before_action :set_calendar, only: [:index, :show, :new, :edit, :create, :update, :destroy, :book]
  before_action :set_slot, only: [:show, :edit, :update, :destroy, :book]

  # On saute une etape de securite si on appelle BOOK en JSON
  skip_before_action :verify_authenticity_token, only: [:book]

  # GET /hairdressers/:hairdresser_id/calendars/:calendar_id
  # GET /hairdressers/:hairdresser_id/calendars/:calendar_id.json
  def index
    @slots = @calendar.slots
  end

  # GET /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id
  # GET /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id.json
  def show
  end

  # GET /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/new
  def new
    @slot = @calendar.slots.new
  end

  # GET /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id/edit
  def edit
  end

  # POST /hairdressers/:hairdresser_id/calendars/:calendar_id/slots
  # POST /hairdressers/:hairdresser_id/calendars/:calendar_id/slots.json
  def create
    @slot = @calendar.slots.create(slot_params)

    respond_to do |format|
      if @slot.save
        format.html { redirect_to hairdresser_calendar_slot_path(@hairdresser,@calendar, @slot), notice: 'Slot was successfully created.' }
        format.json { render :show, status: :created, location: @slot }
      else
        format.html { render :new }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id
  # PATCH/PUT /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id.json
  def update
    respond_to do |format|
      if @slot.update(slot_params)
        format.html { redirect_to hairdresser_calendar_slot_path(@hairdresser, @calendar, @slot), notice: 'Slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @slot }
      else
        format.html { render :edit }
        format.json { render json: @slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id
  # DELETE /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id.json
  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to hairdresser_calendar_slots_path(@hairdresser, @calendar), notice: 'Slot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  # POST /hairdressers/:hairdresser_id/calendars/:calendar_id/slots/:id/book.json
  def book
    @booking = Booking.create(booking_params)
    # on precise que le nouvel objet correspond au service
    #@booking.service = @service #TODO: find a way to transmit the service wanted through the precedent link
    #@booking.user = @user #TODO: add @user
    @booking.day = @calendar.day
    @booking.start_time = @slot.start_time
    @booking.end_time = @slot.end_time

    respond_to do |format|
      if @booking.save
        format.json
      else
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end    end


  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hairdresser
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_calendar
    @calendar = @hairdresser.calendars.find(params[:calendar_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_slot
    @slot = @calendar.slots.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def slot_params
    params.require(:slot).permit(:start_time, :end_time)
  end


  def booking_params
    params.require(:booking).permit()
  end

end

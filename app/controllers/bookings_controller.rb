class BookingsController < BaseController
  before_action :authenticate_user!
  before_action :set_hairdresser, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :set_booking, only: [:show, :edit, :update, :destroy]


  # GET /hairdressers/:hairdresser_id/bookings
  # GET /hairdressers/:hairdresser_id/bookings.json
  def index
    @bookings = @hairdresser.bookings
  end

  # GET /hairdressers/:hairdresser_id/bookings/:id
  # GET /hairdressers/:hairdresser_id/bookings/:id.json
  def show
  end

  # GET /hairdressers/:hairdresser_id/bookings/new
  def new
    @booking = @hairdresser.bookings.new
  end

  # GET /hairdressers/:hairdresser_id/bookings/:id/edit
  def edit
  end

  # POST /hairdressers/:hairdresser_id/bookings
  # POST /hairdressers/:hairdresser_id/bookings.json
  def create
    @booking = @hairdresser.bookings.create(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to hairdresser_booking_path(@hairdresser,@booking), notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairdressers/:hairdresser_id/bookings/:id
  # PATCH/PUT /hairdressers/:hairdresser_id/bookings/:id.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to hairdresser_booking_path(@hairdresser, @booking), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairdressers/:hairdresser_id/bookings/:id
  # DELETE /hairdressers/:hairdresser_id/bookings/:id.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to hairdresser_bookings_path(@hairdresser), notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_hairdresser
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = @hairdresser.bookings.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def booking_params
    params.require(:booking).permit(:calendar_id, :slot_id)
  end

end

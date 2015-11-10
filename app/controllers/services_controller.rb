class ServicesController < BaseController
  before_action :authenticate_user!, except: [:book] #TODO: remove
  before_action :set_hairdresser, only: [:index, :show, :new, :edit, :create, :update, :destroy, :book]
  before_action :set_service, only: [:show, :edit, :update, :destroy, :book]

  # On saute une etape de securite si on appel BOOK en JSON
  skip_before_action :verify_authenticity_token, only: [:book]

  # GET /hairdressers/:hairdresser_id/services
  # GET /hairdressers/:hairdresser_id/services.json
  def index
    @services = @hairdresser.services
  end

  # GET /hairdressers/:hairdresser_id/services/:id
  # GET /hairdressers/:hairdresser_id/services/:id.json
  def show
  end

  # GET /hairdressers/:hairdresser_id/services/new
  def new
    @service = @hairdresser.services.new
  end

  # GET /hairdressers/:hairdresser_id/services/:id/edit
  def edit
  end

  # POST /hairdressers/:hairdresser_id/services
  # POST /hairdressers/:hairdresser_id/services.json
  def create
    @service = @hairdresser.services.create(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to hairdresser_service_path(@hairdresser,@service), notice: 'Service was successfully created.' }
        format.json { render :show, status: :created, location: @service }
      else
        format.html { render :new }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairdressers/:hairdresser_id/services/:id
  # PATCH/PUT /hairdressers/:hairdresser_id/services/:id.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to hairdresser_service_path(@hairdresser, @service), notice: 'Service was successfully updated.' }
        format.json { render :show, status: :ok, location: @service }
      else
        format.html { render :edit }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairdressers/:hairdresser_id/services/:id
  # DELETE /hairdressers/:hairdresser_id/services/:id.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to hairdresser_services_path(@hairdresser), notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /hairdressers/:hairdresser_id/services/:id/book.json
  def book
    @booking = Booking.create(booking_params)
    # on precise que le nouvel objet correspond au service
    @booking.service = @service
    #@booking.user = @user #TODO: add @user

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
  def set_service
    @service = @hairdresser.services.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_params
    params.require(:service).permit(:name, :price, :description, :photo)
  end

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end

end

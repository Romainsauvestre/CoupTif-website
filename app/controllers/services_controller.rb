class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /hairdressers/:hairdresser_id/services
  # GET /hairdressers/:hairdresser_id/services.json
  def index
    @services = Service.find_by_hairdresser_id(@hairdresser_id)
  end

  # GET /hairdressers/:hairdresser_id/services/:id
  # GET /hairdressers/:hairdresser_id/services/:id.json
  def show
  end

  # GET /hairdressers/:hairdresser_id/services/new
  def new
    @service = Service.new
  end

  # GET /hairdressers/:hairdresser_id/services/:id/edit
  def edit
  end

  # POST /hairdressers/:hairdresser_id/services
  # POST /hairdressers/:hairdresser_id/services.json
  def create
    @service = Service.new(service_params)

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
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
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
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
      format.html { redirect_to services_url, notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = Service.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_params
    params.require(:service).permit(:name, :price, :description, :photo, @hairdresser_id)
  end

end

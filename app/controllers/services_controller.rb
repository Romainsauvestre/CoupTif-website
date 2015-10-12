class ServicesController < ApplicationController

  # GET /hairdressers/:hairdresser_id/services
  # GET /hairdressers/:hairdresser_id/services.json
  def index
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @services = @hairdresser.services
  end

  # GET /hairdressers/:hairdresser_id/services/:id
  # GET /hairdressers/:hairdresser_id/services/:id.json
  def show
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @service = @hairdresser.services.find(params[:id])
  end

  # GET /hairdressers/:hairdresser_id/services/new
  def new
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @service = @hairdresser.services.new
  end

  # GET /hairdressers/:hairdresser_id/services/:id/edit
  def edit
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @service = @hairdresser.services.find(params[:id])
  end

  # POST /hairdressers/:hairdresser_id/services
  # POST /hairdressers/:hairdresser_id/services.json
  def create
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
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
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @service = @hairdresser.services.find(params[:id])

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
    @hairdresser = Hairdresser.find(params[:hairdresser_id])
    @service = @hairdresser.services.find(params[:id])

    @service.destroy
    respond_to do |format|
      format.html { redirect_to hairdresser_services_path(@hairdresser), notice: 'Service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_params
    params.require(:service).permit(:name, :price, :description, :photo)
  end

end

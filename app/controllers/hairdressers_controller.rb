class HairdressersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :nearby]
  before_action :set_hairdresser, only: [:show, :edit, :update, :destroy]

  # GET /hairdressers
  # GET /hairdressers.json
  def index
    @hairdressers = Hairdresser.all
  end

  # GET /hairdressers/1
  # GET /hairdressers/1.json
  def show
  end

  # GET /hairdressers/new
  def new
    @hairdresser = Hairdresser.new
  end

  # GET /hairdressers/1/edit
  def edit
  end

  # POST /hairdressers
  # POST /hairdressers.json
  def create
    @hairdresser = Hairdresser.new(hairdresser_params)

    respond_to do |format|
      if @hairdresser.save
        format.html { redirect_to @hairdresser, notice: 'Hairdresser was successfully created.' }
        format.json { render :show, status: :created, location: @hairdresser }
      else
        format.html { render :new }
        format.json { render json: @hairdresser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hairdressers/1
  # PATCH/PUT /hairdressers/1.json
  def update
    respond_to do |format|
      if @hairdresser.update(hairdresser_params)
        format.html { redirect_to @hairdresser, notice: 'Hairdresser was successfully updated.' }
        format.json { render :show, status: :ok, location: @hairdresser }
      else
        format.html { render :edit }
        format.json { render json: @hairdresser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hairdressers/1
  # DELETE /hairdressers/1.json
  def destroy
    @hairdresser.destroy
    respond_to do |format|
      format.html { redirect_to hairdressers_url, notice: 'Hairdresser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Geolocalisation
  def nearby
    distance = params[:distance] || 1
    @hairdressers = Hairdresser.within(distance, :units => :kms, :origin => [params[:lat], params[:lng]])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hairdresser
      @hairdresser = Hairdresser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hairdresser_params
      params.require(:hairdresser).permit(:first_name, :last_name, :description, :photo)
    end
end

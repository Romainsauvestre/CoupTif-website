class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]

  # GET /hairdressers/:id/services
  # GET /hairdressers/:id/services.json
  def index
    @services = Service.find_by_hairdresser_id(@id)
  end

end

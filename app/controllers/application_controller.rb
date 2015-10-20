class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # TODO: changer le before_action authenticate pour le mettre aux bons endroits (autoriser de browser les coiffeurs)
end

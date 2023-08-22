class CommutesController < ApplicationController
  def index
    if params[:original_lat] != "" && params[:original_lon] != ""
    else
      address_format
      coordinates = CoordinatesFacade.new(params[:address]).coordinates
      params[:original_lat] = coordinates[0].latitude
      params[:original_lon] = coordinates[0].longitude
    end
  end
end
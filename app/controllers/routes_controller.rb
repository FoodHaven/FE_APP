class RoutesController < ApplicationController
  def index
    params[:latitude] = params[:latitude].to_f
    params[:longitude] = params[:longitude].to_f
    params[:original_lat] = params[:original_lat].to_f
    params[:original_lon] = params[:original_lon].to_f
    @routes = RouteFacade.new(params).all_routes
  end
end
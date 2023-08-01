class RoutesController < ApplicationController
  def index
    @routes = RouteFacade.new(params).all_routes
  end
end
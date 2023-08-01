class RoutesController < ApplicationController
  def index
    begin
      @routes = RouteFacade.new(params).all_routes
    rescue JSON::ParserError
    end
  end

  def show
    @route = RouteFacade.new(params).single_route
  end
end
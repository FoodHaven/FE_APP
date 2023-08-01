class RoutesController < ApplicationController
  def index
    begin
      @routes = RouteFacade.new(params).all_routes
    rescue JSON::ParserError
    end
  end
end
class LocationController < ApplicationController
  def index
    @location = Location.first
  end
end
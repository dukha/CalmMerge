class LocationTreeController < ApplicationController
  def show
    #the menu action displays menu to ask user to add remove edit display a location
    @location = Location.find(params[:id])
  end

end

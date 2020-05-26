class FlatsController < ApplicationController
  def index
    @flats = Flat.all

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
  end
end

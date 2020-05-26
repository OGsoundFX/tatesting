class FlatsController < ApplicationController
  def index
    @flats = Flat.all

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @marker = [{ lat: @flat.latitude, lng: @flat.longitude, infoWindow: render_to_string(partial: "info_window", locals: { flat: @flat })} ]

    @flats = Flat.all
    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end
end

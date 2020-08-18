class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = Flat.search_by_flat_location_title_and_description(params[:query])
    else
      @flats = Flat.all
    end

    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
    authorize @flats
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
    authorize @flat
    authorize @flats
    # authorize @markers
  end
end

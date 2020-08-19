class FlatsController < ApplicationController
  def index
    if params[:query].present?
      @flats = policy_scope(Flat)
      @flats = Flat.search_by_flat_location_title_and_description(params[:query])
      authorize @flats
    else
      # @flats = Flat.all
      @flats = policy_scope(Flat)
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

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    authorize @flat
    @flat.user_id = current_user.id
    @flat.save
    redirect_to flats_path
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.destroy
    redirect_to flats_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :location, :description)
  end
end

class InstrumentsController < ApplicationController
  def index
    if params[:query].present?
      @instruments = Instrument.geocoded.algolia_search(params[:query])
    else
      @instruments = Instrument.all.geocoded
    end

    # @instruments = @instruments.geocoded

    @markers = @instruments.map do |instrument|
      {
        lat: instrument.user.latitude,
        lng: instrument.user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { instrument: instrument })
      }
    end

  end

  def show
    @booking = Booking.new
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(params_instrument)
    @instrument.user = current_user
    if @instrument.save!
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  private
  def params_instrument
    params.require(:instrument).permit(:name, :category, :price, :location, :description, photos: [])
  end
end

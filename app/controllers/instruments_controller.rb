class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
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
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  private
  def params_instrument
    params.require(:instrument).permit(:name, :category, :price, :location)
  end
end

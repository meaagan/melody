class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def update
  end

  def new
    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument

    if @booking.save
      redirect_to bookings_confirmation_path(@instrument)
    else
      render :new
    end
  end

  def confirmation

  end

  private
  def booking_params
    params.require(:booking).permit(:content)
  end
end

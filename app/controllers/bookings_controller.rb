class BookingsController < ApplicationController
  def index
    # @bookings = Booking.where(@booking.user.id = current_user)
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    @booking.user = current_user

    if @booking.save
      redirect_to booking_confirmation_path(@booking)
    else
      render :new
    end
  end

  def confirmation
    @booking = Booking.find(params[:booking_id])
  end

  private
  def booking_params
    params.require(:booking).permit(:content)
  end
end

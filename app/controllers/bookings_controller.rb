class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def update
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
  end

  private
  def booking_params
  end
end

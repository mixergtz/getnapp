class Admin::BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]

  def index
    @bookings = Room.all.includes(:bookings)
  end

  def show
  end

  def update
    @booking.update(booking_params)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:status)
    end
end

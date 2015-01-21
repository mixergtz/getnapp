class Admin::BookingsController < ApplicationController
  layout "admin"
  before_action :set_booking, only: [:show, :update]

  def index
    @bookings = Hotel.all.includes(:bookings, :rooms)
  end

  def show

  end

  def update
    @booking.update(booking_params)
    NotificationMailer.confirmed_booking_email.deliver if @booking.confirmed?
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:status)
    end
end

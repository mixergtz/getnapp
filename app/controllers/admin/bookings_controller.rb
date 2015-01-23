class Admin::BookingsController < AdminController

  before_action :set_booking, only: [:show, :update]

  def index
    @bookings = Hotel.all.includes(:bookings, :rooms)
  end

  def update
    @booking.update(booking_params)
    NotificationMailer.confirmed_booking_email(@booking).deliver if @booking.confirmed?
    redirect_to admin_bookings_path, notice: "Booking confirmed, user notified"
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:status)
    end
end

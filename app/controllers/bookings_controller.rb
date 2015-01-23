class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:update]

  def index
    @bookings = current_user.bookings
  end

  def create
    room_availability = RoomAvailability.find(params[:availability_id])
    if room_availability.available?
      @booking = Booking.create(room: room_availability.room,
                                arrival: room_availability.start,
                                price: room_availability.price,
                                hours: room_availability.hours,
                                status: :pending,
                                user: current_user)
      room_availability.update(available: false)
      redirect_to user_bookings_path, notice: "Booking waiting for confirmation"
    else
      render :sorry
    end
  end

  def update
    @booking.update(status: :pending_cancel)
    redirect_to user_bookings_path, notice: "Cancel request for your booking has been sent"
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

end

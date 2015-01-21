class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :update]

  def index
  end

  def show
  end

  def create
    room_availability = RoomAvailability.find(params[:availability_id])
    if room_availability.available?
      @booking = Booking.create(room: room_availability.room,
                                arrival: room_availability.start,
                                price: room_availability.price,
                                hours: room_availability.hours,
                                status: :pending)
      room_availability.update(available: false)
      redirect_to show_booking_path(@booking)
    else
      render :sorry
    end
  end

  def update
    @booking.update(status: :pending_cancel)
    #render :cancel
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      #params.require(:booking).permit(:room_id, :arrival, :price, :status, :hours)
    end
end

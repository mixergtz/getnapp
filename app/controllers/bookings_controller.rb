class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
  end

  def show
    respond_with(@booking)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    respond_with(@booking)
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      #params.require(:booking).permit(:room_id, :arrival, :price, :status, :hours)
    end
end

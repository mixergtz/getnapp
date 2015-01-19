class Admin::RoomAvailabilitiesController < ApplicationController
  layout "admin"
  before_action :set_room_availability, only: [:update, :destroy]
  before_action :set_room, only: [:new, :create]

  def new
    @room_availability = @room.room_availabilities.new
  end

  def create
    if @room.room_availabilities.create(room_availability_params)
      redirect_to admin_room_path(@room), notice: "Availability for this room created"
    else
      render :new
    end
  end

  def update
    if @room_availability.update(room_availability_params)
      redirect_to admin_room_path(@room_availability.room), notice: "Room Availability edited"
    else
      redirect_to admin_room_path(@room_availability.room), notice: "Error Room Availability not updated"
    end
  end

  def destroy
    @room_availability.destroy
    redirect_to admin_room(@room_availability.room), notice: 'Room Availability was successfully destroyed.'
  end

  private

    def set_room_availability
      @room_availability = RoomAvailability.find(params[:id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end


    def room_availability_params
      params.require(:room_availability).permit(:start, :available, :hours, :price)
    end

end

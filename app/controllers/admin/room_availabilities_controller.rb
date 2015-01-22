class Admin::RoomAvailabilitiesController < AdminController
  before_action :set_room_availability, only: [:update, :destroy]
  before_action :set_room, only: [:new, :create]
  before_action :set_hotel

  def new
    @room_availability = @room.room_availabilities.new
  end

  def create
    @room_availability = @room.room_availabilities.build(room_availability_params)
    if @room_availability.save
      redirect_to admin_hotel_room_path(@hotel, @room), notice: "Availability for this room created"
    else
      render :new
    end
  end

  def update
    if @room_availability.update(room_availability_params)
      redirect_to admin_hotel_room_path(@hotel, @room_availability.room), notice: "Room Availability edited"
    else
      redirect_to admin_hotel_room_path(@hotel, @room_availability.room), notice: "Error Room Availability not updated"
    end
  end

  def destroy
    @room_availability.destroy
    redirect_to admin_hotel_room(@room_availability.room), notice: 'Room Availability was successfully destroyed.'
  end

  private

    def set_room_availability
      @room_availability = RoomAvailability.find(params[:id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end


    def room_availability_params
      params.require(:room_availability).permit(:start, :available, :hours, :price)
    end

end

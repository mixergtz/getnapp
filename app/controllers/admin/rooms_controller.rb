class Admin::RoomsController < ApplicationController
  layout "admin"
  before_action :set_hotel
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def create
    @room = @hotel.rooms.new(room_params)
    if @room.save
      redirect_to admin_hotel_rooms_path, notice: "Room created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(room_params)
      redirect_to admin_hotel_rooms_path, notice: "Room edited"
    else
      render :edit
    end
  end

  def destroy
    @room.destroy
    redirect_to admin_hotel_rooms_path, notice: 'Room was successfully destroyed.'
  end

  private

    def set_room
      @room = Room.find(params[:id])
    end

    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end


    def room_params
      params.require(:room).permit(:name, :image, :address, :description, :lat, :long)
    end

end
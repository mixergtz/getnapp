class Admin::RoomsController < ApplicationController
  layout "admin"
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = Room.all
  end

  def show
    @hotel = Hotel.find(params[:hotel_id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to admin_hotel_rooms_path, notice: "Room created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @room = Room.update(room_params)
    if @room.save
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


    def room_params
      params.require(:room).permit(:name, :address, :description, :lat, :long)
    end

end
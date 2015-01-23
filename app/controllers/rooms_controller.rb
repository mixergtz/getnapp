class RoomsController < ApplicationController

  def index

    if params[:location].present? && params[:arrival].present?
      @search_date = DateTime.civil(*params[:arrival].sort.map(&:last).map(&:to_i))
      @available_rooms_near = RoomAvailability.availables(@search_date).rooms_near_to(params[:location], 20)
      @available_hotels = []
    elsif params[:location].present?
      @search_date = DateTime.now
      @available_rooms_near = RoomAvailability.availables(@search_date).rooms_near_to(params[:location], 20)
      @available_hotels = []
    elsif params[:arrival].present?
      @search_date = DateTime.civil(*params[:arrival].sort.map(&:last).map(&:to_i))
      @available_rooms_near = RoomAvailability.availables(@search_date).rooms_near_to([request.location.latitude, request.location.longitude], 20)
      #@available_rooms_near = RoomAvailability.availables(@search_date).rooms_near_to(params[:location], 20)
      @available_hotels = []
    end

  end

  def show
    #@room = Room.find(params[:room_id])
    @room_availability = RoomAvailability.includes(:room).find(params[:availability_id])
  end

end

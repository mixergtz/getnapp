class RoomsController < ApplicationController

  def index

    if params[:location].present? && params[:arrival].present?
      search_date = DateTime.civil(*params[:arrival].sort.map(&:last).map(&:to_i))
      @available_rooms_near = RoomAvailability.availables(search_date).rooms_near_to(params[:location], 20)
    else
      #if its not set, set current location and current date by default
    end

  end

  def show
  end

end

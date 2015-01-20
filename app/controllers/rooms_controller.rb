class RoomsController < ApplicationController
  def index

    if params[:location].present?
      @rooms = @expenses.where("concept ILIKE ?", "%#{params[:concept]}%")
    end
    if params[:arrival].present?
      @expenses = @expenses.where("category_id = ?", params[:category_id])
    end


  end

  def show
  end
end

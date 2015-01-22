class Admin::HotelsController < AdminController

  before_action :set_hotel, only: [:show, :edit, :update, :destroy]

  def index
    @hotels = current_user.hotels
  end

  def show
  end

  def new
    @hotel = Hotel.new
  end

  def edit
  end

  def create
    @hotel = current_user.hotels.new(hotel_params)
    if @hotel.save
      redirect_to admin_hotels_path, notice: "Hotel created"
    else
      render :new
    end
  end

  def update
    if @hotel.update(hotel_params)
      redirect_to admin_hotels_path, notice: "Hotel edited"
    else
      render :edit
    end
  end

  def destroy
    @hotel.destroy
    redirect_to admin_hotels_path, notice: 'Hotel was successfully destroyed.'
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :image, :address, :description, :latitude, :longitude)
    end
end

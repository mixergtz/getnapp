class AddRoomsToHotels < ActiveRecord::Migration
  def change
    add_reference :rooms, :hotel, index: true
  end
end

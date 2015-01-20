class RemoveLatLongFromRooms < ActiveRecord::Migration
  def change
    remove_column :rooms, :lat
    remove_column :rooms, :long
  end
end

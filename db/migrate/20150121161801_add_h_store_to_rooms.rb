class AddHStoreToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :extra_info, :hstore
  end
end

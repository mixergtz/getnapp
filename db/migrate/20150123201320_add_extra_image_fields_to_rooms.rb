class AddExtraImageFieldsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :img_extra1, :string
    add_column :rooms, :img_extra2, :string
  end
end

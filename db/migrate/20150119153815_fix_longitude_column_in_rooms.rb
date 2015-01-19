class FixLongitudeColumnInRooms < ActiveRecord::Migration
  def change
    rename_column :rooms, :lang, :long
    change_column_default :rooms, :rating, 3
  end
end

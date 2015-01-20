class RemoveAddressFromRoom < ActiveRecord::Migration
  def change
    remove_column :rooms, :address
  end
end

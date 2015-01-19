class CreateRoomAvailabilities < ActiveRecord::Migration
  def change
    create_table :room_availabilities do |t|
      t.references :room, index: true
      t.datetime :start
      t.integer :hours, default: 0
      t.boolean :available, default: false
      t.integer :price, default: 0

      t.timestamps null: false
    end
    add_foreign_key :room_availabilities, :rooms
  end
end

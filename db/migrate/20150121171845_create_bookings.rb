class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :room, index: true
      t.datetime :arrival
      t.integer :price
      t.integer :status
      t.integer :hours

      t.timestamps null: false
    end
    add_foreign_key :bookings, :rooms
  end
end

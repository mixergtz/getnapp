class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :address
      t.text :description
      t.float :lat
      t.float :lang
      t.integer :rating
      t.string :image

      t.timestamps null: false
    end
  end
end

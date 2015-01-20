class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :image
      t.string :address
      t.text :description
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end

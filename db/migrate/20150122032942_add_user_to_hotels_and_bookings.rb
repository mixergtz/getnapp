class AddUserToHotelsAndBookings < ActiveRecord::Migration
  def change
    add_reference :hotels, :user, index: true
    add_reference :bookings, :user, index: true
  end
end

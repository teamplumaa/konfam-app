class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :service, foreign_key: true
      t.datetime :booking_date
      t.integer :offer

      t.timestamps
    end
  end
end

class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :status
      t.references :beast
      t.references :user

      t.timestamps
    end
  end
end

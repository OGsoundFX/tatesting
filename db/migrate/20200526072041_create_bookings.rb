class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :start_
      t.date :date
      t.date :end_date
      t.references :flat
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

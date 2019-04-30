class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :mentor, foreign_key: true
      t.string :stripe_transaction

      t.timestamps
    end
  end
end

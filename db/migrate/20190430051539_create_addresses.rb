class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :state
      t.string :street
      t.string :suburb
      t.integer :postcode
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

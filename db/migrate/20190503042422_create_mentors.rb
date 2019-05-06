class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.integer :rate
      t.text :about_me
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

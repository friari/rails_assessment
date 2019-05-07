class RemoveDateOfBirthFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :date_of_birth, :integer
    add_column :users, :date, :date
  end
end

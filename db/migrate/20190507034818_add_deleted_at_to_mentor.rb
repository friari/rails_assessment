class AddDeletedAtToMentor < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :delete_at, :datetime
    add_index :mentors, :delete_at
  end
end

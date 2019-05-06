class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.float :rating
      t.references :mentor, foreign_key: true

      t.timestamps
    end
  end
end

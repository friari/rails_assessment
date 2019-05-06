class CreateMentorsSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors_skills do |t|
      t.references :mentor, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end

class Skill < ApplicationRecord
    has_many :mentors_skills
    has_many :mentors, through: :mentors_skills
end

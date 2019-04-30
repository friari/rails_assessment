class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentors_skill
  has_many :skills, through: :mentors_skills
  has_many :reviews
  has_many :bookings
end

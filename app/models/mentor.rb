class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentors_skill
  has_many :skills, through: :mentors_skills
  has_many :reviews
  has_many :bookings
  has_one_attached :picture
end

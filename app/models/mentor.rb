class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentors_skills, dependent: :destroy
  has_many :skills, through: :mentors_skills, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings
  has_one_attached :picture
end

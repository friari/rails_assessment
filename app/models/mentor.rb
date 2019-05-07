class Mentor < ApplicationRecord
  belongs_to :user
  has_many :mentors_skills, dependent: :destroy
  has_many :skills, through: :mentors_skills, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookings
  has_one_attached :picture
  validates :user_id, uniqueness: true

  def conversion
   
    number = self.rate / 100.0
     sprintf('%.2f', number) 
  end

  def conversion_to_dollars
    number = self.rate * 100.0
    sprintf('%2f', number)
  end
end

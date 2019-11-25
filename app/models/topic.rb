class Topic < ApplicationRecord
CATEGORIES = %w{Apparel Entertainment Food General Politics}
LEVELS = (1..5)
  belongs_to :user
  has_many :debates, dependent: :destroy
  has_many :arguments, dependent: :destroy
  validates :proposition, :level, :description, :category, presence: true
  validates :proposition, uniqueness: true
end

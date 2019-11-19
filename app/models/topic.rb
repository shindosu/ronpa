class Topic < ApplicationRecord
  has_many :debates
  has_many :arguments
  validates :proposition, :level, presence: true
  validates :proposition, uniqueness: true
end

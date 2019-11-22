class Topic < ApplicationRecord
  has_many :debates, dependent: :destroy
  has_many :arguments, dependent: :destroy
  validates :proposition, :level, presence: true
  validates :proposition, uniqueness: true
end

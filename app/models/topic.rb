class Topic < ApplicationRecord
  validates :proposition, :level, presence: true
  validates :proposition, uniqueness: true
end

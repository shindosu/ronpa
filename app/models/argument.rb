class Argument < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :uses, through: :user
  validates :content, presence: true
  validates :content, length: { maximum: 35 }
  enum side: [:affirmative, :negative]
end

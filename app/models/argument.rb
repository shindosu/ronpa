class Argument < ApplicationRecord
  belongs_to :topic
  belongs_to :user
  has_many :uses, through: :user
  validates :content, presence: true
end

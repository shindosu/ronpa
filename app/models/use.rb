class Use < ApplicationRecord
  belongs_to :debate
  belongs_to :user

  enum side: [:affirmative, :negative]

  validates :content, :side, :debate, :user, presence: true
end

class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :debate

  enum role: [:affirmative, :negative, :moderator]
  enum result: { pending: 0, winner: 1, loser: 2 }

  validates :user, :debate, :role, presence: true
end

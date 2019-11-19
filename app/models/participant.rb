class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :debate

  enum role: [:affirmative, :negative, :moderator]

  validates :user, :debate, :role, presence: true
end

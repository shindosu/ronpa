class Debate < ApplicationRecord
  belongs_to :topic
  has_many :uses
  has_many :participants

  enum phase: {
    waiting_start: 0,
    affirmative_speech: 1,
    negative_cross_examination_preparation: 2,
    negative_cross_examination: 3,
    negative_speech: 4,
    positive_cross_examination_preparation: 4,
    positive_cross_examination: 5,
    negative_closing_statement: 6,
    positive_closing_statement: 7,
    waiting_end: 8,
    finished: 9
  } do
    end

  scope :active, -> { where.not(phase: :finished) }
end

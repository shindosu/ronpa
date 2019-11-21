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
    positive_cross_examination_preparation: 5,
    positive_cross_examination: 6,
    negative_closing_statement: 7,
    positive_closing_statement: 8,
    waiting_end: 9,
    finished: 10
  } do
    end

  scope :active, -> { where.not(phase: :finished) }
end

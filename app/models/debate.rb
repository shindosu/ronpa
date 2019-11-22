class Debate < ApplicationRecord
  belongs_to :topic
  has_many :uses
  has_many :participants

  enum phase: {
    waiting_start: 0,
    count_in: 1,
    affirmative_speech: 2,
    negative_cross_examination_preparation: 3,
    negative_cross_examination: 4,
    negative_speech: 5,
    affirmative_cross_examination_preparation: 6,
    affirmative_cross_examination: 7,
    negative_closing_statement: 8,
    affirmative_closing_statement: 9,
    waiting_end: 10,
    finished: 11
  } do
  end

  scope :active, -> { where.not(phase: :finished) }
  scope :affirmative_turn, -> do
    where(phase: [:affirmative_speech,
                  :affirmative_cross_examination_preparation,
                  :affirmative_cross_examination,
                  :affirmative_closing_statement])
  end
  scope :negative_turn, -> do
    where(phase: [:negative_speech,
                  :negative_cross_examination_preparation,
                  :negative_cross_examination,
                  :negative_closing_statement])
  end

  def with_slot?(role)
    participants.send(role).none?
  end
end

class Debate < ApplicationRecord
  belongs_to :topic
  has_many :uses, dependent: :destroy
  has_many :participants, dependent: :destroy

  enum phase: {
    waiting_start: 0,
    count_in: 1,
    affirmative_speech: 2,
    negative_cross_examination_preparation: 3,
    negative_cross_examination: 4,
    negative_speech_preparation: 5,
    negative_speech: 6,
    affirmative_cross_examination_preparation: 7,
    affirmative_cross_examination: 8,
    affirmative_closing_statement_preparation: 9,
    affirmative_closing_statement: 10,
    negative_closing_statement_preparation: 11,
    negative_closing_statement: 12,
    waiting_end: 13,
    finished: 14
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

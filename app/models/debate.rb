class Debate < ApplicationRecord
  belongs_to :topic
  has_many :uses
  has_many :participants

  enum phase: [
    :waiting_start, :affirmative_speech,
    :negative_cross_examination_preparation,
    :negative_cross_examination,
    :negative_speech,
    :positive_cross_examination_preparation,
    :positive_cross_examination,
    :negative_closing_statement,
    :positive_closing_statement,
    :waiting_end
  ]
end

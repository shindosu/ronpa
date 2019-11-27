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

  PHASE_TITLES = {
    waiting_start: "Finding participants...",
    count_in: "count-in",
    affirmative_speech: "Affirmative opening arguments",
    negative_cross_examination_preparation: "Negative X exam prep",
    negative_cross_examination: "Negative X exam",
    negative_speech_preparation: "Negative opening argument prep",
    negative_speech: "Negative opening arguments",
    affirmative_cross_examination_preparation: "Affirmative X exam prep",
    affirmative_cross_examination: "Affirmative X exam",
    affirmative_closing_statement_preparation: "Affirmative closing prep",
    affirmative_closing_statement: "Affirmative closing",
    negative_closing_statement_preparation: "Negative closing prep",
    negative_closing_statement: "Negative closing",
    waiting_end: "final scoreing",
    finished: "<h3>The winner is Someone</h3>"
  }

  AFFIRMATIVE_PHASES = [
    :affirmative_speech,
    :affirmative_cross_examination_preparation,
    :affirmative_cross_examination,
    :affirmative_closing_statement_preparation,
    :affirmative_closing_statement
  ]

  NEGATIVE_PHASES = [
      :negative_speech_preparation,
      :negative_speech,
      :negative_cross_examination_preparation,
      :negative_cross_examination,
      :negative_closing_statement_preparation,
      :negative_closing_statement
  ]

  scope :active, -> { where.not(phase: :finished) }

  def with_slot?(role)
    participants.send(role).none?
  end

  def affirmative_turn?
    AFFIRMATIVE_PHASES.include?(phase.to_sym)
  end

  def negative_turn?
    NEGATIVE_PHASES.include?(phase.to_sym)
  end

  def phase_type
    if affirmative_turn?
      return "affirmative"
    elsif negative_turn?
      return "negative"
    else
      return "neutral"
    end
  end

  def self.phase_type(phase)
    if AFFIRMATIVE_PHASES.include?(phase)
      return "affirmative"
    elsif NEGATIVE_PHASES.include?(phase)
      return "negative"
    else
      return "neutral"
    end
  end

  def moderator
    participants.moderator.first&.user
  end

  def affirmative_user
    participants.affirmative.first&.user
  end

  def negative_user
    participants.negative.first&.user
  end

  def broadcast_advance(user)
    ActionCable.server.broadcast("debate_#{id}", {
      current_phase: phase,
      current_user_id: user.id
    })
  end

end

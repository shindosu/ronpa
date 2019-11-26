class DebatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "debate_#{params[:debate_id]}"
    broadcast_debate_data(Debate.find(params[:debate_id]))
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.broadcast_debate_data(debate)
    ActionCable.server.broadcast("debate_#{debate.id}", {
      current_phase: debate.phase,
      affirmative_turn: debate.affirmative_turn?,
      affirmative_user: debate.affirmative_user,
      negative_user: debate.negative_user,
      moderator: debate.moderator,
      page_html: ApplicationController.render(
        template: 'debates/_updated_show',
        locals: { debate: debate }
        )
    })
  end
end

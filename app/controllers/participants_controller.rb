class ParticipantsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @debate = Debate.waiting_start.find_by(topic_id: @topic.id)
    if @debate && !current_user.in_debate?
      @participant = Participant.new(debate: @debate, user: current_user)
      if @debate.participants.count == 1
        @participant.affirmative!
      else
        @participant.negative!
      end
    else
      render "topics/show"
    end
  end
end

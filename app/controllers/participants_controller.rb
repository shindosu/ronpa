class ParticipantsController < ApplicationController
  def create
    @topic = Topic.find(params[:id])
    @debate = Debate.waiting_start.find(topic_id: @topic)
    @participant = Participant.new(debate: @debate, user: current_user)
    if @debate.participants.count == 1
      @participant.affirmative!
    else
      @participant.negative!
    end
  end
end

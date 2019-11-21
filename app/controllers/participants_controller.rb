class ParticipantsController < ApplicationController
  def create
    @debate = Debate.find(params[:debate_id])
    @topic = @debate.topic
    # @debate = Debate.waiting_start.find_by(topic_id: @topic.id)
    if @debate && !current_user.in_debate?
      @participant = Participant.new(debate: @debate, user: current_user)
      authorize @participant
      if @debate.participants.count == 1
        @participant.affirmative!
      else
        @participant.negative!
      end
      redirect_to debate_path(@debate)
    else
      render "topics/show"
    end
  end
end

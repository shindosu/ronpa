class ParticipantsController < ApplicationController
  def create
    @debate = Debate.find(params[:debate_id])
    @topic = @debate.topic
    authorize @topic
    if @debate && !current_user.in_debate? && current_user.arguments.where(topic_id: @topic.id).count >= 6
      @participant = Participant.new(debate: @debate, user: current_user)
      authorize @participant
      if @debate.participants.count == 1
        @participant.affirmative!
      else
        @participant.negative!
      end
      redirect_to debate_path(@debate) if @participant.save
    else
      render "topics/show"
    end
  end
end

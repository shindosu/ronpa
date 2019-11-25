class ParticipantsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    authorize @topic
    # if current_user.debates.active.none?
      @open_debates = @topic.debates.waiting_start
      @participant = Participant.new(user: current_user)
      authorize @participant
      if @open_debates.any?
        if params[:moderator] && debate_with_slot(:moderator)
          @participant.assign_attributes(role: "moderator", debate: @debate)
        # elsif debate_with_slot(:affirmative) && debate_with_slot(:negative)
        #   @participant.assign_attributes(user: current_user, role: ["affirmative", "negative"].sample, debate: @debate)
        elsif debate_with_slot(:affirmative)
          @participant.assign_attributes(role: "affirmative", debate: @debate)
        elsif debate_with_slot(:negative)
          @participant.assign_attributes(role: "negative", debate: @debate)
        end
      else
        @debate = Debate.create(topic: @topic)
        role = params[:moderator] ? "moderator" : ["affirmative", "negative"].sample
        @participant.assign_attributes(role: role, debate: @debate)
      end
      if @participant.save
        redirect_to debate_path(@debate)
      else #remove this and line below
        redirect_to topic_path(@topic)
      end
    # else
    #   redirect_to topic_path(@topic)
    # end
  end

  def set_result
    @debate = Debate.find(params[:debate_id])
    @winner = Participant.find(params[:winner_id])
    authorize @winner
    @winner.result = :winner
    @loser = @winner.affirmative? ? @debate.participants.negative.first : @debate.participants.affirmative.first
    @loser.result = :loser
    if @winner.save && @loser.save
      @debate.update(phase: Debate.phases[@debate.phase] + 1)
    end
    redirect_to debate_path(@debate)
  end

  private

  def debate_with_slot(role)
    @debate = @open_debates.find { |debate| debate.with_slot?(role) }
  end
end

  # def create
  #   @debate = Debate.find(params[:debate_id])
  #   @topic = @debate.topic
  #   authorize @topic
  #   if @debate && !current_user.in_debate? && current_user.arguments.where(topic_id: @topic.id).count >= 6
  #     @participant = Participant.new(debate: @debate, user: current_user)
  #     authorize @participant
  #     if @debate.participants.count == 1
  #       @participant.affirmative!
  #     else
  #       @participant.negative!
  #     end
  #     redirect_to debate_path(@debate) if @participant.save
  #   else
  #     render "topics/show"
  #   end
  # end

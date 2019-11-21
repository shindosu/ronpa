class DebatesController < ApplicationController
  def index
    @debates = policy_scope(Debate)
  end

  def show
    @debate = Debate.find(params[:id])
    authorize @debate
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @debate = Debate.new(topic: @topic)
    authorize @debate
    if @debate.save
      Participant.create(debate: @debate, role: "moderator", user: current_user)
      redirect_to debate_path(@debate)
    else
      render "topics/show"
    end
  end
end

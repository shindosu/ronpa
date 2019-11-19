class DebatesController < ApplicationController
  def show
    @debate = Debate.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:id])
    @debate = Debate.new(topic: @topic)
    if @debate.save
      Participant.create(debate: @debate, role: "moderator", user: current_user)
      redirect_to debate_path(@debate)
    else
      render "topics/show"
    end
  end
end

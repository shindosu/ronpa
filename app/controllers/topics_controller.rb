class TopicsController < ApplicationController
  
  def index
    @topics = policy_scope(Topic)
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end
end

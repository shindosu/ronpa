class TopicsController < ApplicationController
  def index
    @topics = policy_scope(Topic)
    if params[:query].present?
      sql_query = "proposition ILIKE :query OR category ILIKE :query"
      @topics = @topics.where(sql_query, query: "%#{params[:query]}%")
    else
      @topics = Topic.all
    end
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @argument = Argument.new
  end
end

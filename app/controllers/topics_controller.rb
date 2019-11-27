class TopicsController < ApplicationController
  before_action 
  def index
    @topics = policy_scope(Topic)
    if params[:query].present?
      sql_query = "proposition ILIKE :query OR category ILIKE :query"
      @topics = @topics.where(sql_query, query: "%#{params[:query]}%")
    else
      @topics = Topic.all.order("LOWER(proposition)")
    end
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @argument = Argument.new
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    authorize @topic
    if @topic.save
      redirect_to @topic
    else
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:proposition, :level, :description, :category, :user_id)
  end
end

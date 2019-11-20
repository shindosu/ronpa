class TopicsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "proposition ILIKE :query OR category ILIKE :query"
      @topics = Topic.where(sql_query, query: "%#{params[:query]}%")
    else
      @topics = Topic.all
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end
end

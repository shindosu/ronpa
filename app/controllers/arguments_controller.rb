class ArgumentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @argument = Argument.new(argument_params)
    @argument.user = current_user
    @argument.topic = @topic
    if @argument.save
      redirect_to topic_path(@topic)
    else
      render 'topics/show'
    end
  end

  def update
    @argument = Argument.find(params[:id])
    if @argument.update(argument_params)
      redirect_to topic_path(@argument.topic)
    else
      render 'topics/show'
    end
  end

  private

  def argument_params
    params.require(:argument).permit(:content, :side)
  end
end

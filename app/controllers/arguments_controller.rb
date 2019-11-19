class ArgumentsController < ApplicationController
  def create
    @topic = Topic.find(params[:id])
    @argument = Argument.new(argument_params)
    if @argmuent.save
      redirect_to topic_path(@topic)
    else
      render 'topics/show'
    end
  end

  private

  def argument_params
    params.require(:argument).permit(:content, :side)
  end
end

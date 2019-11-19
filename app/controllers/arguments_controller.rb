class ArgumentsController < ApplicationController
  def create
    @argument = Argument.new(argument_params)
  end

  private
  def argument_params
    params.require(:argument).permit(:content, :side)
  end
end

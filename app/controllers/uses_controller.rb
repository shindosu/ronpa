class UsesController < ApplicationController
  def create
    Participant.affirmative.first.user.arguments.where(topic_id: debate.topic_id).affirmative
  end
  
  def update
  end
end

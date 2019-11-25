class DebatesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "debate_#{params[:debate_id]}"
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

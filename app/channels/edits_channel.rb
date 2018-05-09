class EditsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "edits_channel"
    puts "---------------------------Edits Connection Made----------------------------"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

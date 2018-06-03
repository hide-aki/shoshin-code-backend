class EditsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "edits_channel"
    stream_from "edits_#{params[:session]}"
    puts "---------------------------Edits Connection Made----------------------------"
    puts ""
    puts '****************** #subscribed params[:session] ******************'
    puts params[:session]
    puts '****************** #subscribed params[:session] ******************'
  end

  def receive( data )
    # puts '****************** received data ******************'
    # puts data
    # puts '****************** received data ******************'
    puts '****************** #receive params[:session] ******************'
    puts params[:session]
    puts '****************** #receive params[:session] ******************'
    ActionCable.server.broadcast "edits_#{params[:session]}", data
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
 
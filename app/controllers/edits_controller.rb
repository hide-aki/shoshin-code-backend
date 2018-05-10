class EditsController < ApplicationController

  def create
    edit = Edit.new( text: params[:newValue], sender_id: params[:editorId] )
    if edit.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(EditSerializer.new(edit)).serializable_hash

      ActionCable.server.broadcast 'edits_channel', serialized_data
      head :ok

      render json: edit

    else
      render json: {error: 'Could not create that edit'}, status: 422
    end
  end

  private
  def edit_params
    params.require(:edit).permit(:text, :sender_id, :id, :created_at, :updated_at)
  end

end

class EditSerializer < ActiveModel::Serializer
  attributes :text, :sender_id, :id, :created_at, :updated_at
end
 
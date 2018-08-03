class User < ApplicationRecord

  has_many :editor_sessions
  has_many :exercises, through: :editor_sessions

  # Class method to proxy saved attributes from User model to EditorSession. Does the following:
  # Adds the attribute writer editor_sessions_attributes=(attributes)
  # Sets the :autosave option to true, meaning:
  # Always save the associated object when saving the parent object (or destroy it if marked for destruction)
  # By default, only save the associated object if it's a new record
  # (If :autosave is set to false, never save or destroy the associated object)
  # accepts_nested_attributes_for :editor_sessions # ,allow_destroy: true 

  has_secure_password
end
 
class User < ApplicationRecord

  has_many :editor_sessions
  has_many :exercises, through: :editor_sessions

  accepts_nested_attributes_for :editor_sessions

  has_secure_password
end
 
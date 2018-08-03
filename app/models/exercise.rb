class Exercise < ApplicationRecord

  has_many :editor_sessions
  has_many :users, through: :editor_sessions

  serialize :rank, Hash
  serialize :tags, Array

end

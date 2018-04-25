class Exercise < ApplicationRecord
  serialize :rank, Hash
  serialize :tags, Array
end

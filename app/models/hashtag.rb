class Hashtag < ApplicationRecord
  validates :text, presence: true, uniqueness: true
end

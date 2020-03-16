class Event < ApplicationRecord
  validates :title, presence: true
  paginates_per 5
end

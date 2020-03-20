# frozen_string_literal: true

class Event < ApplicationRecord
  PAGES_COUNT = 5

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :organizer_email, presence: true
  validates :organizer_telegram, presence: true
  validates :link, presence: true

  paginates_per PAGES_COUNT
end

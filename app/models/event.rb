# frozen_string_literal: true

# Model class for manages the data, logic and rules of events
class Event < ApplicationRecord
  PAGES_COUNT = 5

  validates :title, presence: true, length: { in: 2..30 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :organizer_email, presence: true
  validates :organizer_telegram, presence: true, length: { in: 5..32 }
  validates :link, presence: true
  validate  :end_time_after_start_time

  paginates_per PAGES_COUNT

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start date")
    end
  end
end


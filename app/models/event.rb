# frozen_string_literal: true

# Model class for manages the data, logic and rules of events
class Event < ApplicationRecord
  PAGES_COUNT = 5
  URL_FORMAT = \
    /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix
  MAIL_FORMAT = /([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})/ix
  validates :title, presence: true, length: { in: 1..30 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate  :end_time_after_start_time
  validates :organizer_email, presence: true
  validates_format_of :organizer_email, with: MAIL_FORMAT

  scope :by_new, -> { order("updated_at DESC") }

  paginates_per PAGES_COUNT

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start date")
    end
  end
end


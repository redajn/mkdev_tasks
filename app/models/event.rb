# frozen_string_literal: true

# Model class for manages the data, logic and rules of events
class Event < ApplicationRecord
  include AASM

  aasm(:state) do
    state :pending, initial: true
    state :approved
    state :rejected

    event :approve do
      transitions from: %i[pending rejected], to: :approved
    end

    event :reject do
      transitions from: %i[pending approved], to: :rejected
    end

    event :to_pending do
      transitions from: %i[rejected approved], to: :pending
    end
  end

  belongs_to :user

  PAGES_COUNT = 5
  URL_FORMAT = \
    /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?/ix.freeze
  validates :title, presence: true, length: { in: 1..30 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate  :end_time_after_start_time
  validates :organizer_telegram, presence: true
  validates :organizer_email, presence: true
  validates :organizer_email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :link, presence: true
  validates :link, format: { with: URL_FORMAT }

  scope :order_by_pub_date, -> { approved.order('updated_at DESC') }

  paginates_per PAGES_COUNT

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, I18n.t('common.date_notice')) if end_time < start_time
  end
end

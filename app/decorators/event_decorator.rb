# frozen_string_literal: true

# Decorator for events
class EventDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def approve_button
    button_to t('.approve'), admin_event_state_index_path(object, state: 'approve') unless approved?
  end

  def reject_button
    button_to t('.reject'), admin_event_state_index_path(object, state: 'reject') unless rejected?
  end

  def to_pending_button
    unless pending?
      button_to t('.pending'), admin_event_state_index_path(object, state: 'to_pending')
    end
  end
end

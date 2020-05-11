# frozen_string_literal: true

# Decorator for events
class EventDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def switch_status_bar
    event.aasm(:state).permitted_transitions.map do |transition|
      event = transition[:event]
      button_to event, admin_event_state_index_path(object, event: event)
    end
  end
end

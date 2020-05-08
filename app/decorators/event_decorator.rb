# frozen_string_literal: true

# Decorator for events
class EventDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def switch_status_bar(transition)
    button_to transition[:event], admin_event_state_index_path(object, state: transition[:event])
  end
end

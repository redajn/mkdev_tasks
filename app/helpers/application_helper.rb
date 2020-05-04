# frozen_string_literal: true

module ApplicationHelper
  def human_date(date)
    date&.to_formatted_s(:event_date_format)
  end

  def filter_state(state = nil)
    link_to state || 'all', admin_events_path(state: state)
  end
end

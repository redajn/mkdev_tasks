# frozen_string_literal: true

module ApplicationHelper
  def human_date(date)
    date&.to_formatted_s(:event_date_format)
  end
end

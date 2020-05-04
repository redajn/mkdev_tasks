# frozen_string_literal: true

class Admin
  # For switching event state
  class StateController < Admin::BaseController
    def create
      event = Event.find(params[:event_id])

      case params[:state]
      when 'approve'
        event.approve
      when 'reject'
        event.reject
      when 'to_pending'
        event.to_pending
      end

      event.save
      redirect_to admin_events_path, notice: t('.success', { state: event.state })
    end
  end
end

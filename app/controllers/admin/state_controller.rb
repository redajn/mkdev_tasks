# frozen_string_literal: true

class Admin
  # For switching event state
  class StateController < Admin::BaseController
    def create
      event = Event.find(params[:event_id])
      event.send params[:state]

      if event.save
        redirect_to admin_events_path, notice: t('.success', { state: event.state })
      else
        redirect_to admin_event_path(event), notice: t('.fail')
      end
    end
  end
end

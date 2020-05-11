# frozen_string_literal: true

class Admin
  # For switching event state
  class StateController < Admin::BaseController
    before_action :set_event, only: [:create]

    def create
      @event.send state_event if state_event.present?

      if @event.save
        redirect_to admin_events_path, notice: t('.success', { state: @event.state })
      else
        redirect_to admin_event_path(event), notice: t('.fail')
      end
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def state_event
      if @event.aasm(:state).events(permitted: true).map(&:name).include? params[:event].to_sym
        params[:event]
      end
    end
  end
end

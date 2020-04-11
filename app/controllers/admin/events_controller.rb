# frozen_string_literal: true

class Admin
  # Controller class for events actions
  class EventsController < Admin::BaseController
    before_action :set_event, only: %i[update edit destroy]

    def index
      @events = Event.by_new.page(params[:page])
    end

    def show
      @event = Event.find(params[:id])
    end

    def edit; end

    def update
      if @event.update(event_params)
        redirect_to admin_event_path(@event), notice: t(".success")
      else
        render :edit, notice: t(".edit")
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path
    end

    private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(
        :title,
        :description,
        :location,
        :start_time,
        :end_time,
        :organizer_email,
        :organizer_telegram,
        :link
      )
    end
  end
end

# frozen_string_literal: true

class Admin
  # Controller class for events actions
  class EventsController < Admin::BaseController
    before_action :set_event, only: %i[change_state show update edit destroy]

    def index
      @events = case state
                when 'pending'
                  pending_events
                when 'approved'
                  approved_events
                when 'rejected'
                  rejected_events
                else
                  Event.all.page(params[:page])
                end
    end

    def show; end

    def edit; end

    def update
      if @event.update(event_params)
        redirect_to admin_event_path(@event), notice: t('.success')
      else
        render :edit, notice: t('.fail')
      end
    end

    def destroy
      @event.destroy
      redirect_to admin_events_path, notice: t('.success')
    end

    def change_state
      case params[:state]
      when 'approve'
        @event.approve
      when 'reject'
        @event.reject
      when 'to_pending'
        @event.to_pending
      end
      @event.save
      redirect_to admin_events_path, notice: "#{t('.success')} #{@event.state}"
    end

    private

    def pending_events
      Event.pending.page(params[:page])
    end

    def rejected_events
      Event.rejected.page(params[:page])
    end

    def approved_events
      Event.approved.page(params[:page])
    end

    def state
      params[:state]
    end

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

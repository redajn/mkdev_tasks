# frozen_string_literal: true

# Controller class for events actions
class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_event, only: %i[update edit destroy]

  def index
    @events = Event.order_by_pub_date.page(params[:page])
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: t('.success')
    else
      render :edit, notice: t('.fail')
    end
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to event_path(@event), notice: t('.success')
    else
      render :new, notice: t('.fail')
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: t('.success')
  end

  private

  def set_event
    @event = current_user.events.find(params[:id])
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

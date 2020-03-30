# frozen_string_literal: true

# Controller class for events actions
class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :require_permission, only: %i[ edit update destroy]
  before_action :set_event, only: %i[show update edit destroy]

  def index
    @events = Event.by_new.page(params[:page])
  end

  def new
    @event = Event.new
  end

  def show; end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def require_permission
    if current_user != Event.find(params[:id]).user
      redirect_to root_path, notice: "Permission denied"
    end
  end

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

class EventsController < ApplicationController
  before_action :set_event, only: %i[show update edit destroy]

  def index
    @events = Event.order('updated_at DESC').page(params[:page])
  end

  def new
    @event = Event.new
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:format])
  end

  def event_params
    params.require(:event).permit(
      :title,
      :description,
      :location,
      :starttime,
      :endtime,
      :organizeremail,
      :organizertelegram,
      :link
    )
  end
end

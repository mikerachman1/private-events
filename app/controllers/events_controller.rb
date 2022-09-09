class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = "Your event was created"
      redirect_to @event
    else
      flash[:alert] = "Error"
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end

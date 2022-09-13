class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to @event, notice: "Event Created"
    else
      flash.now[:notice] = 'Error'
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event, notice: "Event Updated"
    else 
      flash.now[:notice] = 'Error'
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    
    redirect_to root_path, status: :see_other
  end

  def rsvp
    @event = Event.find(params[:id])
    
    if @event.attendees.include?(current_user)
      redirect_to @event, notice: "You are on list"
    else
      @event.attendees << current_user
      redirect_to @event
    end
  end

  def cancel_rsvp
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user)
    redirect_to @event, notice: "You were removed from list"
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end

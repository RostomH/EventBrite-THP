class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(admin: current_user,
      title: params[:event][:title],
      start_date: params[:event][:start_date],
      duration: params[:event][:duration],
      description: params[:event][:description],
      price: params[:event][:price],
      location: params[:event][:location]
      )

    if @event.save
    flash[:success] = "L'évènement a été créé avec succès."
    redirect_to events_path(@event.id)
    else
    flash[:error] = "Ca sent la vieille trace de pneu pour toi mon coco..."
    render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params # récupérer les params
    event_params = params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end

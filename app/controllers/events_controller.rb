class EventsController < ApplicationController
    def index
        @money=Money.find(1)
        @events=Event.all
    end
    def show
        @event=Event.find(params[:id])
    end
    def edit
        @event=Event.find(params[:id])
    end
    def update
        @event=Event.find(params[:id])
        @event.assign_attributes(params[:event].permit(:title, :amount, :day,:recorded))
        @event.save
        @money=Money.find(1)
        @events=Event.all
        render :index
    end
end

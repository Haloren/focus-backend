class EventsController < ApplicationController

    def index
        events = Event.all
        render json: events
    end

    def show
        event = Event.find_by(id: params[:id])
        render json: event
    end

    def create
        event = Event.new(event_params)
        if event.save
            render json: event
        else
            render json: {message: event.errors.full_messages.to_sentence}
        end
    end

    def destroy
        event = Event.all.find_by(id: parmas[:id])
        user = User.find(event.user_id)
        if event
            event.destroy
            render json: user
        else 
            render json: {message: "Delete failed"}
        end
    end

    private
    def event_params
        params.require(:event).permit(:title, :date, :user_id)
    end
end

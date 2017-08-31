class TopController < ApplicationController
    def index
        @money=Money.find(1)
        @events=Event.all
    end
end

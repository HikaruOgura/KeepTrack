class EventsController < ApplicationController
    def index
        before_index
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
        @money=Money.find(1)
        if @event.save
            update_money(@event,@money)
            before_index
            render :index
        else
            render "new"
        end
    end


    def new
        @event=Event.new
    end

    def create
        @event=Event.new(params[:event].permit(:title, :amount, :day,:recorded))
        @money=Money.find(1)
        if @event.save
            update_money(@event,@money)
            before_index
            redirect_to  :root,notice: "新しいeventを登録しました"
        else
            render "new"
        end
    end
    def destroy
        @money=Money.find(1)
        @event=Event.find(params[:id])
        rollback_money(@event,@money)
        @event.destroy
        before_index
        redirect_to :root,notice: "eventを削除しました"
    end
    def record
        @event=Event.find(params[:id])
        @money=Money.find(1)
        update_money(@event,@money)
        @event.recorded=true
        @event.save
        before_index
        redirect_to :root
    end

    private
    def before_index
        @money=Money.find(1)
        @events_should_recorded=Event.where(day: Time.now.last_year .. Time.now).where(recorded: 0).order("day")
        gon.count=Event.where(day: Time.now.last_year .. Time.now).where(recorded: 0).load.count
        @events_unrecorded=Event.where(recorded: 0).order("day")
        @events_recorded=Event.where(recorded: true).order(day: :desc)
        @ThisMonth=Time.now.month
        @LastMonth=Time.now.last_month.month
        @ThisMonth_income=0
        @ThisMonth_spending=0
        @LastMonth_spending=0
        @LastMonth_income=0
        Event.all.each do |event|
            if event.day.month==@ThisMonth
                if event.amount > 0
                    @ThisMonth_income+=event.amount
                else
                    @ThisMonth_spending+=event.amount
                end
            elsif event.day.month==@LastMonth
                if event.amount > 0
                    @LastMonth_income+=event.amount
                else
                    @LastMonth_spending+=event.amount
                end
            else
            end
        end
    end
    def update_money(event,money)
        if event.recorded==true
            if event.debit==false
                money.wallet+=event.amount
                money.save
            else
                money.bank+=event.amount
                money.save
            end
        end
    end
    def rollback_money(event,money)
        if event.recorded==true
            if event.debit==false
                money.wallet-=event.amount
                money.save
            else
                money.bank-=event.amount
                money.save
            end
        end
    end
end

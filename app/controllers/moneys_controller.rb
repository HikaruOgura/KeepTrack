class MoneysController < ApplicationController
    def edit
        @money=Money.first
    end
    def update
        @money=Money.first
        @money.assign_attributes(params[:money].permit(:wallet,:bank))
        if @money.save
            redirect_to :root, notice: "持ち金を変更しました"
        else
            redirect_to "edit"
        end

    end
end

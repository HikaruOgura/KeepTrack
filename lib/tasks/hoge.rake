desc "clean up old events"
task clean_up: :environment do
    Event.where("day < ?" ,Time.now.last_month.last_month).each do |event|
        event.destroy
    end

end

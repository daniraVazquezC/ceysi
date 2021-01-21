class WeeklyNotificationController < ApplicationController

  def send_notification
    StockMailer.send_weekly_notification
  end
end

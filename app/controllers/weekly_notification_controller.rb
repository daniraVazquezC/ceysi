class WeeklyNotificationController < ApplicationController

  def send_notification
    StockMailer.send_weekly_notification
    render json: {status: "ok"}
  end
end

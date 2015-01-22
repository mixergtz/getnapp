class NotificationMailerPreview < ActionMailer::Preview

  def confirmed_booking_email
    @booking = Booking.first
    NotificationMailer.confirmed_booking_email(@booking)
  end

end
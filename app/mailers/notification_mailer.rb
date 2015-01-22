class NotificationMailer < ApplicationMailer

  def confirmed_booking_email(booking)
    @booking = booking
    mail(to: @booking.user.email, subject: "Your booking has been accepted")
  end

end

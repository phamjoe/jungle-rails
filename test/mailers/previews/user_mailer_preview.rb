class UserMailerPreview < ActionMailer::Preview
  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: user, subject: "Order ##{order.id} has been placed")
  end
end
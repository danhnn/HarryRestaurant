class UserMailer < ApplicationMailer
    default from: "bestseoisme@gmail.com"
 
  def welcome_email(order,order_url)
    @order = order
    @url  = order_url
    mail(to: @order.email, subject: 'Your Order has been summited!')
  end
end

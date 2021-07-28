class CustomerMailer < ApplicationMailer
  def notify_order(order)
  	@order = order
  	@sender = order.sending_customer
  	@receiver = order.receiving_customer
  	mail(
  		to: [@sender.email, @receiver.email].join(','),
  		subject: "Your courier #{order.id} is in #{order.status}"
  	)
  end
end

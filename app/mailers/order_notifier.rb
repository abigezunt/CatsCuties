class OrderNotifier < ActionMailer::Base
  default from: "kaner.cat@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order

    mail to: order.email, subject: "Cat's Cuties Order Confirmation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order

    mail to: order.email, subject: "Cat's Cuties Order Shipped"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.order_created.subject
  #
  def order_created(order)
    @order = order

    mail to: "kaner.cat@gmail.com", subject: "New Order from Cat's Cuties"
  end
end

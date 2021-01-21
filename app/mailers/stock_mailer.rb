class StockMailer < ApplicationMailer
  # Comentario: Solo se envia el correo si de los productos de la orden,
  # al menos uno tiene una cantidad minima de existencias definida y a la vez el stock es menor a dicha cantidad

  def self.send_notification(order)
    emails = Setting.find_by(key: "stock_notice_emails").value.split(",")
    order_products = order.transaction_details.collect(&:product).uniq
    products = order_products.select{ |product| product.restock? }
    if products.size > 0
      emails.each{ |email| low_stock_notice(email.strip, products).deliver_now }
    end
  end

  def low_stock_notice(email, products)
    @products = products
    mail(to: email, subject: "Notificación de bajas existencias")
  end

end

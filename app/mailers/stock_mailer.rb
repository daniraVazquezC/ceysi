class StockMailer < ApplicationMailer
  # Comentario: Solo se envia el correo si de los productos de la orden, en caso de que sea el semanal va a revisar todos los productos,
  # al menos uno tiene una cantidad minima de existencias definida y a la vez el stock es menor a dicha cantidad

  # Comentario: Esto envia el aviso cada vez que se hace una orden de egreso o un ajuste de cantidad
  def self.send_notification(order)
    emails = Setting.find_by(key: "stock_notice_emails").value.split(",")
    order_products = order.transaction_details.collect(&:product).uniq
    products = order_products.select{ |product| product.restock? }
    if products.size > 0
      emails.each{ |email| low_stock_notification(email.strip, products).deliver_now }
    end
  end

  # Comentario: Esto envia el aviso cada semana
  def self.send_weekly_notification
    emails = Setting.find_by(key: "stock_notice_emails").value.split(",")
    products = Product.low_stock
    if products.size > 0
      emails.each{ |email| low_stock_notification_weekly(email.strip, products).deliver_now }
    end
  end

  # Comentario: Esto envia el aviso por correo
  def low_stock_notification(email, products)
    @products = products
    mail(to: email, subject: "Notificación de bajas existencias" )
  end

  # Comentario: Esto envia el aviso cada semana
  def low_stock_notification_weekly(email, products)
    @products = products
    mail(to: email, subject: "Notificación semanal de bajas existencias" )
  end

end

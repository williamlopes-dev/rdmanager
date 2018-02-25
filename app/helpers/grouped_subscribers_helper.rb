module GroupedSubscribersHelper

  def total_value(product_subscribers)
    total_value = 0.0
    unless product_subscribers.nil?
      product_subscribers.each do |product_subscriber|
        total_value = total_value + product_subscriber.product_price.price_to_f
      end
    end
    total_value
  end

end

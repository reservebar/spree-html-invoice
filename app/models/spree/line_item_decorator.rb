Spree::LineItem.class_eval do
  def tax_price
    return self.price unless Spree::Config[:show_price_inc_vat]
    (self.price * (1  + self.product.effective_tax_rate)).round(2, BigDecimal::ROUND_HALF_UP)
  end
end

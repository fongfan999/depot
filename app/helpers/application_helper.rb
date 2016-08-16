module ApplicationHelper
  def hidden_div_if(condition, attributes = {}, &block)
    attributes["style"] = "display: none" if condition
    content_tag("div", attributes, &block)
  end

  def currency_to_locale(price)
    price *= 1.3 if I18n.locale.to_s == "es"
    number_to_currency price
  end
end

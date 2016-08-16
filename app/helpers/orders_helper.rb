module OrdersHelper
  def payment_types_options
    options = Order::PAYMENT_TYPES.map do |type|
      [I18n.t("orders.payment_types." + type.parameterize.underscore), type]
    end

    options_for_select(Hash[options])
  end
end

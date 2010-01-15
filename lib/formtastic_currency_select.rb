module FormtasticCurrencySelect

  def currency_input(method, options)
    raise "To use the :currency input, please install the currency_select plugin http://github.com/gavinlaking/currency_select" unless self.respond_to?(:currency_select)

    html_options = options.delete(:input_html) || {}
    priority_currencies = options.delete(:priority_currencies) || ["US Dollar", "Euro"]

    self.label(method, options_for_label(options)) <<
      self.currency_select(method, priority_currencies, strip_formtastic_options(options), html_options)
  end

end


if Object.const_defined? "Formtastic"
  Formtastic::SemanticFormBuilder.class_eval { include FormtasticCurrencySelect }
end


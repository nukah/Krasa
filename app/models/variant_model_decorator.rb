Variant.class_eval do
  def option_types
    self.option_values.map { |ov| ov.option_type.presentation }
  end
end
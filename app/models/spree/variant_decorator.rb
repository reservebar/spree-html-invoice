Spree::Variant.class_eval do 
  def full_name
    "#{self.name} #{options_text}"
  end
  
  def options_text
    return "" unless option_values.first
    self.option_values.map { |ov| "#{ov.presentation}" }.to_sentence({:words_connector => ", ", :two_words_connector => ", "})
  end

  def presentation
    on = option_values.first
    on ? on.presentation : nil 
  end

  def presentation= val
    on = option_values.first
    if on
      on.name = val
      on.presentation = val
      on.save!
    end
  end
end

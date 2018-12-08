module Converter
  class Parser
    def parse(number)
      binding.pry
      Conversion.number_to_words(number)

    end
  end
end
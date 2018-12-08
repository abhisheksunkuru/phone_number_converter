require 'pry'
module Converter
  class Conversion

    NUMBER_HASH = {
      2 => %w(a b c),
      3 => %w(d e f),
      4 => %w(g h i),
      5 => %w(j k l),
      6 => %w(m n o),
      7 => %w(p q r s),
      8 => %w(t u v),
      9 => %w(w x y z)

    }

    def self.number_to_words(number)
      binding.pry
    end
  end
end
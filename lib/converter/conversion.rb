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

    DICTIONARY = File.readlines('dictionary.txt').map{|w| w.strip}

    def self.valid_word?(word)
      upcase_word = word.upcase
      word  = DICTIONARY.bsearch{|w| w >= upcase_word}

      word == upcase_word
    end

    def self.number_to_word(number)

      possible_combinations = nil
      number.each_char do |digit|
        codes = NUMBER_HASH[digit.to_i]
         raise "Invalid symbol '#{digit}' in the phone" if codes.nil?

        if possible_combinations
          possible_combinations = possible_combinations.product(codes)
        else


          possible_combinations = codes
        end
      end



      test_words = possible_combinations.map { |e|  e.flatten().join }

      test_words.select! { |w| valid_word?(w) }

      test_words
    end

    def self.number_to_words(number)
      last_numbers  = number.dup
      full_phone_words = number_to_word(number)
      all_words = full_phone_words
      first_numbers = ''
      while last_numbers.length >3 do
        first_numbers += last_numbers.slice!(0)
        next if first_numbers.length < 3
        first_words = number_to_word(first_numbers)
        last_words = number_to_word(last_numbers)

        if first_words.length>0 && last_words.length>0
          combinations = first_words.product(last_words)
          all_words += combinations
        end

        # remove full_phone_words from all_words pairs
        all_words.select!{|e| !full_phone_words.include?(e[0]+e[1]) }

      end
      all_words
    end
  end
end
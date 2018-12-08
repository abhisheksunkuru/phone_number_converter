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
      result = []
      possible_combinations = nil
      number.each_char do |digit|

        if possible_combinations
          possible_combinations = possible_combinations.product(NUMBER_HASH[digit.to_i])
        else
          possible_combinations = NUMBER_HASH[digit.to_i]
        end
      end

      test_words = possible_combinations.map { |e| e.flatten().join}

      test_words.select! { |w| valid_word?(w) }

      test_words
    end

    def self.number_to_words(number)
      # phone_number  = number.dup
      # all_words = number_to_word(number)
      # phone_number.each_char do |char|
      #   words_list =

      # ends
    end
  end
end
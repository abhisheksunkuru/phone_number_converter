require_relative 'lib/converter/parser'
require_relative 'lib/converter/conversion'
#require_relative 'dictionary.txt'


p Converter::Parser.new.parse(ARGV[0])
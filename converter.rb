require_relative 'lib/converter/parser'
require_relative 'lib/converter/conversion'



p Converter::Parser.new.parse(ARGV[0])

require_relative 'word.rb'

class Scrabble

	attr_accessor :word

	def initialize
		@word = Word.new
	end

end
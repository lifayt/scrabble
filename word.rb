
require_relative 'dictionary'

class Word

	attr_accessor :dictionary

	def initialize
		@dictionary = Dictionary.new()	
	end

	def self.validate(word)
		is_word?(word)
	end

	def self.anagrams(word)
		anagrams(word) 
	end

	def self.subwords(word)
		subwords(word)
	end

end
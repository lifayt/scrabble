
require_relative 'dictionary'

class Word

	attr_accessor :dictionary

	def initialize(path)
		@dictionary = Dictionary.new(path).dictionary
	end

	def validate(word)
		key_validate(word)
	end

	def anagrams(word)
		component_search(word)
	end

	def subwords(word)
		subword_search(word)
	end

	private

	def keyify(word)
		word.chars.sort.join
	end

	def key_validate(word)
		@dictionary[keyify(word)].include?(word)
	end

	#DEPRECATED

	# returns an array of all words in the dictionary that share the same components as the originally defined word
	def component_search(word)
		length_match_list = @dictionary.find_all {|match| match.length == word.length}
		word_match_list = length_match_list.find_all {|match| match.chars.sort.join == word.chars.sort.join}
	end

	# returns an array of all words in the dictionary of lesser length that contain letters that are contained in the original word
	def subword_search(word)
		length_match_list = @dictionary.find_all {|match| match.length < word.length }
		word_match_list = length_match_list.find_all {|match| word.chars.sort.join.include?(match.chars.sort.join)}
	end

end
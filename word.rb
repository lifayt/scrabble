
require_relative 'dictionary'

class Word

	attr_accessor :dictionary, :validated, :anagram_list, :subword_list

	def initialize(path)
		@dictionary = Dictionary.new(path).dictionary
	end

	def validate(word)
		@validated = key_validate(word)
	end

	def anagrams(word)
		@anagram_list = key_return(word)
	end

	def subwords(word)
		@subword_list = subkey_search(word)
	end

	private

	def keyify(word)
		word.chars.sort.join
	end

	def key_validate(word)
		if @dictionary.has_key?(keyify(word))
			@dictionary[keyify(word)].include?(word)
		else 
			false 
		end
	end

	def key_return(word)
		if @dictionary.has_key?(keyify(word))
			@dictionary[keyify(word)]
		else
			[""]
		end
	end

	def subkey_search(word)
		subword_array = []
		superset_array = powerset(word.chars)
		superset_array.each do |key|
			subword_array << key_return(key.join)
		end
		subword_array.flatten.compact.uniq
	end

	def powerset(charset)
		return [charset] if charset.empty?

		character = charset.pop
		subset = powerset(charset)
		subset | subset.map {|x| x | [character]}
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
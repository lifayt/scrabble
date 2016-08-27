
require_relative 'dictionary'

class Word

	attr_accessor :dictionary

	def initialize
		@dictionary = Dictionary.new().dictionary
	end

	def validate(word)
		@dictionary.include?(word)
	end

	def anagrams(word)
		component_search(word)
	end

	def subwords(word)
		subword_search(word)
	end

	private

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

word = Word.new
puts "Validation Testing!"
puts "%----------------------------------------------------%"
puts "Validating 'apple' : #{word.validate('apple')}"
puts "Validating 'gorgeous' : #{word.validate('gorgeous')}"
puts "Validating 'Polymorph' : #{word.validate('polymorph')}"
puts "\nAnagram Testing!"
puts "%----------------------------------------------------%"
puts "Anagram 'apple' : #{word.anagrams('apple')}"
puts "Anagram 'gorgeous' : #{word.anagrams('gorgeous')}"
puts "Anagram 'polymorph' : #{word.anagrams('polymorph')}"
puts "\nSubword Testing!"
puts "%----------------------------------------------------%"
puts "Subword 'apple' : #{word.subwords('apple')}"
puts "Subword 'gorgeous' : #{word.subwords('gorgeous')}"
puts "Subword 'polymorph' : #{word.subwords('polymorph')}"



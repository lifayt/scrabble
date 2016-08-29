require "minitest/autorun"
require_relative "../dictionary.rb"

class DictionaryTest < Minitest::Test

	def setup
		@dictionary = Dictionary.new("../data/").dictionary
	end

	def test_dictionary_number_of_words
		word_count = 0
		@dictionary.each do |key, value|
			word_count += value.size
		end
		assert_equal(187632, word_count)
	end

end
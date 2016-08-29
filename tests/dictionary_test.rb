require "minitest/autorun"
require_relative "../dictionary.rb"

class DictionaryTest < Minitest::Test

	def setup
		@dictionary = Dictionary.new("../data/").dictionary
	end

	def test_dictionary_size
		assert_equal 168626, @dictionary
	end



end
require "minitest/autorun"
require_relative "../word.rb"

class WordTest < Minitest::Test

	def setup
		@word = Word.new("../data/twl3.txt")
	end

	def test_validation
		assert_equal(true, @word.validate("apple"))
	end

	def test_anagrams
		assert_equal(["appel", "apple", "pepla"], @word.anagrams("apple"))
	end

	def test_subwords
		assert_equal(["ae", "ale", "el", "lea", "leap", "pale", "peal", "plea"], @word.subwords("apple"))
	end
end 
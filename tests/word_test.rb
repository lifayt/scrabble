require "minitest/autorun"
require_relative "../word.rb"

class WordTest < Minitest::Test

	def setup
		@word = Word.new("../data/")
	end

	def test_validation
		assert_equal(true, @word.validate("apple"))
	end

	def test_anagrams
		assert_equal(["appel", "apple", "pepla"], @word.anagrams("apple"))
	end

	def test_subwords
		assert_equal(["pa", "al", "la", "alp", "lap", "pal", "ae", "pe", "ape", "pea", "el", "ale", "lea", "leap", "pale", "peal", "plea"], @word.subwords("apple"))
	end
end 
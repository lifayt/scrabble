require "minitest/autorun"
require_relative "../word.rb"

class WordTest < Minitest::Test

	def setup
		@word = Word.new("../data/")
	end

	def test_validation
		t1 = Time.now
		assert_equal(true, @word.validate("apple"))
		assert_equal(true, @word.validate("geography"))
		assert_equal(true, @word.validate("panorama"))
		assert_equal(true, @word.validate("taser"))
		puts "\n%--------------------------------------%"
		puts "Time Validates: #{(Time.now - t1).to_s}"
	end

	def test_anagrams
		t1 = Time.now 
		assert_equal(["appel", "apple", "pepla"], @word.anagrams("apple"))
		assert_equal(["geography"], @word.anagrams("geography"))
		assert_equal(["panorama"], @word.anagrams("panorama"))
		assert_equal(["aster", "rates", "resat", "stare", "tares", "taser", "tears"], @word.anagrams("taser"))
		puts "\n%--------------------------------------%"
		puts "Time Anagrams: #{(Time.now - t1).to_s}"
	end

	def test_subwords
		t1 = Time.now 
		assert_equal(["pa", "al", "la", "alp", "lap", "pal", "ae", "pe", "ape", "pea", "el", "ale", "lea", "leap", "pale", "peal", "plea"], @word.subwords("apple"))
		assert_equal(["go", "oe", "ego", "er", "re", "erg", "reg", "or", "gor", "org", "ore", "roe", "ergo", "goer", "gore", "ogre", "ag", "ae", "age", "gae", "ago", "goa", "ar", "gar", "rag", "are", "ear", "era", "ager", "areg", "gear", "rage", "oar", "ora", "agro", "aero", "pe", "peg", "op", "po", "ope", "per", "rep", "pro", "gorp", "prog", "pore", "repo", "rope", "grope", "pa", "gap", "ape", "pea", "gape", "page", "peag", "apo", "opa", "par", "rap", "aper", "pare", "pear", "rape", "reap", "gaper", "grape", "pager", "parge", "prao", "proa", "pargo", "opera", "pareo", "eh", "he", "ho", "oh", "hog", "hoe", "her", "rho", "hero", "hoer", "ah", "ha", "hag", "hae", "hao", "rah", "argh", "hare", "hear", "rhea", "gerah", "hoar", "hora", "gherao", "hep", "peh", "hop", "pho", "poh", "hope", "ephor", "hoper", "gopher", "hap", "pah", "epha", "heap", "phage", "opah", "harp", "graph", "raphe", "ye", "gey", "oy", "yo", "goy", "rye", "yer", "grey", "gyre", "gory", "gyro", "orgy", "oyer", "yore", "ay", "ya", "gay", "yag", "aye", "yea", "yage", "yoga", "ray", "rya", "yar", "gray", "aery", "eyra", "yare", "year", "gayer", "yager", "gyp", "pye", "yep", "gypo", "pogy", "pogey", "pry", "prey", "pyre", "pyro", "ropy", "porgy", "ropey", "perogy", "pay", "pya", "yap", "gapy", "pray", "grapy", "apery", "payer", "repay", "grapey", "payor", "hey", "yeh", "hoy", "yogh", "hay", "yah", "yeah", "ahoy", "hoya", "hoagy", "hayer", "hoary", "hyp", "hype", "hypo", "hyper", "heapy", "hypogea", "harpy"], @word.subwords("geography"))
		assert_equal(["pa", "an", "na", "nap", "pan", "op", "po", "apo", "opa", "no", "on", "ar", "par", "rap", "ran", "or", "pro", "oar", "ora", "prao", "proa", "nor", "porn", "roan", "apron", "am", "ma", "amp", "map", "pam", "man", "nam", "mo", "om", "mop", "pom", "moa", "oma", "mon", "nom", "mano", "moan", "noma", "arm", "mar", "ram", "pram", "ramp", "mor", "rom", "prom", "romp", "mora", "roam", "morn", "norm", "manor", "roman"], @word.subwords("panorama"))
		assert_equal(["at", "ta", "as", "sat", "tas", "et", "te", "ae", "ate", "eat", "eta", "tae", "tea", "es", "est", "set", "tes", "sae", "sea", "ates", "east", "eats", "etas", "sate", "seat", "seta", "tase", "teas", "ar", "art", "rat", "tar", "ars", "ras", "arts", "rats", "star", "tars", "tsar", "er", "re", "ret", "are", "ear", "era", "rate", "tare", "tear", "ers", "res", "ser", "erst", "rest", "rets", "tres", "ares", "arse", "ears", "eras", "rase", "sear", "sera", "aster", "rates", "resat", "stare", "tares", "taser", "tears"], @word.subwords("taser"))
		puts "\n%--------------------------------------%"
		puts "Time Subword: #{(Time.now - t1).to_s}"
	end
end 
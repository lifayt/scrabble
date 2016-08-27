
require_relative 'data/twl3.txt'

class Dictionary 

	attr_accessor :dictionary

	def initialize
		@dictionary = []
		IO.foreach("twl3.txt") do |line| 
			@dictionary << line
		end
	end

end
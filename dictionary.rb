
class Dictionary 

	attr_accessor :dictionary

	def initialize
		@dictionary = []
		IO.foreach("data/twl3.txt") do |line| 
			@dictionary << line.downcase.strip
		end
	end

end
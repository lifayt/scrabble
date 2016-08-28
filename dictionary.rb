
class Dictionary 

	attr_accessor :dictionary

	def initialize(path)
		@dictionary = []
		IO.foreach(path) do |line| 
			@dictionary << line.downcase.strip
		end
	end

end
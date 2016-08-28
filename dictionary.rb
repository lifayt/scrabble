
class Dictionary 

	attr_accessor :dictionary

	def initialize(path)
		naive_initialize(path)
		#dict_initialize(path)
	end

	private

	def naive_initialize(path)
		@dictionary = []
		IO.foreach(path) do |line| 
			@dictionary << line.downcase.strip
		end
	end 

	def dict_initialize(path)
		@dictionary = {}
		IO.foreach(path) do |line|
			processed_line = line.downcase.strip
			line_key = processed_line.chars.sort.join
			@dictionary[line_key] = [] unless @dictionary.has_key?(line_key)
			@dictionary[line_key] << processed_line
		end
	end

end
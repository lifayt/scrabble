
class Dictionary 

	attr_accessor :dictionary

	def initialize(path)
		dict = path + "twl3.txt"
		dict_serial = path + "dict_serial.dat"
		if File.exist?(dict_serial)
			marshal_load(dict_serial)
		else
			dict_initialize(dict)
			marshal_dump(dict_serial)
		end
	end

	private

	def marshal_dump(path)
		File.open(path, 'w') {|f| f.write(Marshal.dump(@dictionary)) }
	end

	def marshal_load(path)
		@dictionary = Marshal.load(File.read(path))
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

	def naive_initialize(path)
		@dictionary = []
		IO.foreach(path) do |line| 
			@dictionary << line.downcase.strip
		end
	end 

end
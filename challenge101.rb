#!/usr/bin/env ruby

def generate(file="out.data")

	# size =  File.exist?(file) ? File.size(file) : 0
	
	dataSize = 0

	puts 'Start...'

	File.open(file, "w+")  do |f|

		while (File.size(file) / 1024).floor  <  (10 * 1024) do
			# alphabetical strings
			alphabetical = ('a'..'z').sort_by{rand}[0,rand(10..20)].join 
			# alphanumerics strint with spaces
			m,l = 36, 24
			alphanumerics = (' '*rand(1..10)) + (rand(m**l).to_s(m)) + (' '*rand(1..10))
			# integer numbers
			integer = ('1'..'9').sort_by{rand}[0,rand(5..10)].join
			# real
			# ('1'..'9').sort_by{rand}[0,rand(5..10)].join
			real = (rand() * 100 * 10).round(rand(2..4))

			f.puts alphabetical.to_s + ',' + alphanumerics.to_s + ',' + integer.to_s + ',' + real.to_s
		end

		puts "Done. File size: [#{File.size?(file)}] bytes"
	
	end

end

def parse(file="out.data")
	File.open(file, "r").readlines.each  do |line|
		line.split(',').each do |obj| 
			obj = obj.strip
			case obj
			when /^[a-zA-Z]+$/
				puts obj + " - alphabetical strings"
			when /^\d+$/
				puts obj + " - integer"
			when /^\d+\.\d+$/
				puts obj + " - real numbers"
			else /^\w+/
				puts obj + " - alphanumeric"
			end
		end
	end
end

case ARGV[0]
when "-a"
	generate()
when "-b"
	parse()
else
	puts "Usage: ruby challenge101.rb [-a][-b]"
end

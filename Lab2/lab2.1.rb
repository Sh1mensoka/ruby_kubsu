def read_arr(arr, len)
	for i in 0..len - 1 do
		puts "Введите число: "
		num = $stdin.gets.chomp.to_i
		arr << num
	end
	arr
end

def read_from_file(arr, addr)
	file = File.new("#{addr}", "r").each do |line|
		arr << line.to_i
	end
	arr
end

def find_min(arr)
	arr.min
end

def find_max(arr)
	arr.max
end

def elem_sum(arr)
	sum = 0
	arr.cycle(1) {|x| sum += x}
	sum
end

def elem_mult(arr)
	mult = 1
	arr.cycle(1) {|x| mult *= x}
	mult
end

method = ARGV[0]
mas = Array.new
if ARGV[0].end_with?(".txt")
	puts read_from_file(mas, ARGV[0]) 
else
	puts read_arr(mas, ARGV[0].chomp.to_i)
end
# "./input.txt"
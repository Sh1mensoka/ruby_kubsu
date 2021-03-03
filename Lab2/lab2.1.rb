def read_arr(arr,len)
	for i in 0..len - 1 do
		puts "Введите число: "
		num = $stdin.gets.chomp.to_i
		arr.insert(arr.length, num, num)
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

len = ARGV[0].to_i

mas = Array.new
read_arr(mas, len)
puts mas
puts find_min(mas)
puts find_max(mas)
puts elem_sum(mas)
puts elem_mult(mas)
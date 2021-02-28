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

mas = Array.new
puts "Введите число: "
num = gets
until num == "\n"
	if num != "\n"
		mas.push(num.to_i)
	end
	puts "Введите число: "
	num = gets
end
puts mas
puts find_min(mas)
puts find_max(mas)
puts elem_sum(mas)
puts elem_mult(mas)
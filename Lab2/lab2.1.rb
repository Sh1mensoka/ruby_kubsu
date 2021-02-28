def find_min(arr)
	min = arr.first
	arr.each do |x|
		min = x if x < min
	end
	min 
end

def find_max(arr)
	max = arr.first
	arr.each do |x|
		max = x if x > max
	end
	max
end

def elem_sum(arr)
	sum = 0
	arr.each do |x|
		sum += x
	end
	sum
end

def elem_mult(arr)
	mult = 1
	arr.each do |x|
		mult *= x
	end
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
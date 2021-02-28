input_num = ARGV[0].to_i

def num_sum(input)
	sum, num = 0, input
	while num > 0
		sum += num.remainder(10)
		num /=  10
	end
	puts "Сумма цифр числа: #{sum}"
end

def search_min(input)
	min, num = input.remainder(10), input / 10
	while num > 0
		min = num.remainder(10) if num.remainder(10) < min
		num /= 10
	end
	puts "Наименьшая цифра числа: #{min}"
end

def search_max(input)
	max, num = input.remainder(10), input / 10
	while num > 0
		max = num.remainder(10) if num.remainder(10) > max
		num /= 10
	end
	puts "Наибольшая цифра числа: #{max}"
end

def num_multiplication(input)
	res, num = 1, input
	while num > 0
		res *= num.remainder(10)
		num /= 10
	end
	puts "Произведение цифр числа: #{res}"
end

num_sum(input_num)
search_min(input_num)
search_max(input_num)
num_multiplication(input_num)
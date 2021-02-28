def num_sum(input)
	sum, num = 0, input
	while num > 0
		sum += num.remainder(10)
		num /=  10
	end
	sum
end

def search_min(input)
	min, num = input.remainder(10), input / 10
	while num > 0
		min = num.remainder(10) if num.remainder(10) < min
		num /= 10
	end
	min
end

def search_max(input)
	max, num = input.remainder(10), input / 10
	while num > 0
		max = num.remainder(10) if num.remainder(10) > max
		num /= 10
	end
	max
end

def num_multiplication(input)
	res, num = 1, input
	while num > 0
		res *= num.remainder(10)
		num /= 10
	end
	res
end

def simple_div(input)

	def check_simple?(input, divider)
		input.remainder(divider) == 0
	end

	def check_divider?(input)
		for i in 2..input / 2
			false if input.remainder(i) == 0
		end
		true
	end

	sum, simple_divider = 0, 2
	while simple_divider < input / 2
		sum += simple_divider if check_divider?(simple_divider) and check_simple?(input, simple_divider)
		simple_divider += 1
	end
	sum
end

def even_num_more_than_3(input)
	amount, num = 0, input
	while num > 0
		amount += 1 if num.remainder(10) > 3 and num.remainder(10) % 2 != 0
		num /= 10
	end
	amount
end

def special_multiply(input)
	multiplication_result, divider = 1, 2
	while divider <= input / 2
		multiplication_result *= divider if (input % divider == 0) and (num_sum(divider) < num_sum(input))
		divider += 1
	end
	multiplication_result
end

print "Введите число для обработки: "
input_num = $stdin.gets.chomp.to_i

puts "Hello World!" if ARGV.length == 0 

for i in 0..ARGV.length - 1
	case ARGV[i]
	when "0"
		puts "Сумма цифр числа: #{num_sum(input_num)}"
	when "1"
		puts "Наименьшая цифра числа: #{search_min(input_num)}"
	when "2"
		puts "Наибольшая цифра числа: #{search_max(input_num)}"	
	when "3"
		puts "Произведение цифр числа: #{num_multiplication(input_num)}"
	when "4"
		puts "Сумма простых делителей числа: #{simple_div(input_num)}"
	when "5"
		puts "Количество нечетных цифр числа, больших 3: #{even_num_more_than_3(input_num)}"
	when "6"
		puts "Произведение делителей, удовлетворяющих условию: #{special_multiply(input_num)}"
	else
		puts "Некорректная команда!"
	end
end
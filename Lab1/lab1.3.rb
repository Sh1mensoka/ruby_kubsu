input_num = ARGV[0].to_i
sum = 0
while input_num > 0
	sum += input_num.remainder(10)
	input_num /=  10
end
puts sum

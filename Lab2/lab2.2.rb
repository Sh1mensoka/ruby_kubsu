def read_arr(arr, len)
	for i in 0..len - 1 do
		puts "Введите число: "
		num = gets.chomp.to_i
		arr << num
	end
	arr
end

def max_elems(arr)
	max = arr[0]
	counter = 0
	arr.each do |x|
		if x >= max
			max = x
			counter = 0
		else
			counter += 1
		end
	end
	puts "Количество элементов, расположенных после последнего максимального:
#{counter}"
end

def push_to_end(arr)
	min = arr[0]
	ind = 0
	for i in 0..arr.length - 1
		if arr[i] < min
			min = arr[i]
			ind = i
		end
	end
	for i in 0..ind - 1
		arr.push(arr.shift)
	end
	puts "Измененный массив: #{arr.inspect}"
end

arr = Array.new
puts "Введите количество элементов в массиве:"
max_elems(read_arr(arr, gets.chomp.to_i))
push_to_end(arr)
def read_arr(arr, len)
	for i in 0..len - 1 do
		puts "Введите число: "
		num = gets.chomp.to_i
		arr << num
	end
	arr
end

def max_elems(arr)
	puts "Количество элементов, расположенных после последнего максимального: #{arr.drop(arr.rindex(arr.max) + 1).length}"
end

def push_to_end(arr)
	mas = arr.select {|x| arr.index(x) < arr.index(arr.min)}
	arr.select! {|x| arr.index(x) >= arr.index(arr.min)}.concat(mas)
	puts "Измененный массив: #{arr.inspect}"
end

def max_in_interval(arr, a, b)
	puts "Максимальный элемент в интервале [#{a}, #{b}]: #{arr[a, b].max}"
end

def get_indexes(arr)
	puts "Индексы элементов, меньших своего левого соседа: "
	arr.select {|x| puts arr.index(x) if arr[arr.index(x)] < arr[arr.index(x) - 1]}
	puts "Количество таких элементов: #{arr.select {|x| arr[arr.index(x)] < arr[arr.index(x) - 1]}.length}"
end

def build_list(arr)

	def check_simple(del)
		for i in 2..del / 2
			if del % i == 0
				false
			end
		end
		true
	end

	mas = Array.new
	for i in arr[0, arr.length - 1]
		for j in 2..i / 2
			if i % j == 0 && check_simple(j) && !mas.include?(j)
				mas << j
			end
		end
	end
	puts "Список положительных простых делителей: #{mas}"
end

def str_to_int(str)
	mas = str.split(" ")
	mas.each{|x| mas[mas.index(x)] = x.to_i}.max
end


def ru_symb(str)
	str.count("/А-Яа-я/")
end

def latin_palindrome(str)
	latin_str = ""
	str.scan(/[a-z]/) {|x| latin_str.concat(x)}
	latin_str.eql?(latin_str.reverse)
end

def search_data(str)
	str.scan(/\d{2}.\d{2}.\d{4}/).inspect
end

# puts str_to_int("22 5 17 8 27 5 12")
# puts ru_symb("Съешь bulku")
# puts latin_palindrome("Съешь buLKu")
puts search_data ("Сегодня, то есть today 27.03.2021")
# arr = Array.new
# puts "Введите количество элементов в массиве:"
# max_elems(read_arr(arr, gets.chomp.to_i))
# push_to_end(arr)
# max_in_interval(arr, gets.chomp.to_i, gets.chomp.to_i)
# get_indexes(arr)
# build_list(arr)
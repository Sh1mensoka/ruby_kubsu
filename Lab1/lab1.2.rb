name = ARGV[0]
puts "Hello #{name}" 
ARGV.clear
print 'Какой язык у Вас самый любимый? '
lang = gets.chomp
unless lang == 'ruby'
	puts 'Скоро будет ruby.'
else
	puts 'Подлиза.'
end

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
print "Введите команду Ruby: "
com_ruby = gets.chomp
print "Введите команду ОС: "
com_os = gets.chomp
system("ruby -e \"#{com_ruby}\"")
system("#{com_os}")
name = ARGV[0]
puts "Hello #{name}" 
ARGV.clear
print 'Какой язык у Вас самый любимый? '
lang = gets.chomp
if lang == 'ruby'
	puts 'Подлиза.'
elsif lang == 'python'
	puts 'Скоро будет ruby. Вкус у Вас, конечно, не очень.'
elsif lang == 'java'
	puts 'Скоро будет ruby, но выбор хороший.'
end

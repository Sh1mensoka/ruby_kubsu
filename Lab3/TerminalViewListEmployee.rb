c_r = File.dirname(__FILE__)
require "#{c_r}/Employee.rb"

class TerminalViewListEmployee

	attr_accessor :employee_list

	def initialize()
		self.employee_list= Array.new
	end

	def add_employee()
		puts "Введите ФИО:"
		fio = Employee.fio_convert(gets.chomp)
		puts "Введите год рождения:"
		year = Employee.year_convert(gets.chomp)
		puts "Введите телефон:"
		tel = Employee.tel_convert(gets.chomp)
		puts "Введите адрес:"
		addr = gets.chomp
		puts "Введите e-mail:"
		email = Employee.email_convert(gets.chomp)
		puts "Введите паспортные данные:"
		pass = Employee.pass_convert(gets.chomp)
		puts "Введите специальность:"
		spec = gets.chomp
		puts "Введите опыт работы"
		exp = gets.chomp
		if (exp.to_i != 0)
			puts "Введите предыдущее место работы:"
			workplace = gets.chomp
			puts "Введите должность на прошлом месте работы:"
			post = gets.chomp
			puts "Введите зарплату на прошлом месте работы:"
			sal = gets.chomp
			employee_list << Employee.new(fio, year, tel, addr, email, pass, spec, exp, workplace, post, sal)
		else
			employee_list << Employee.new(fio, year, tel, addr, email, pass, spec, exp)
		end
	end

	def print_employees()
		employee_list.each {|x| puts "\n#{x}\n"}
	end

	def write_to_file(addr)
		file_to_write = File.new("#{addr}", "r+")
		employee_list.each {|x| file_to_write.syswrite("#{x.to_s}\n\n")}
		file_to_write.close
	end
end

list = TerminalViewListEmployee.new()
list.add_employee()
list.print_employees()
list.write_to_file("input.txt")

c_r = File.dirname(__FILE__)
require "#{c_r}/ListEmployee.rb"

class TerminalViewListEmployee

	attr_accessor :employee_list

	def initialize()
		self.employee_list= ListEmployee.new()
	end

	def add_employee()
		puts "Введите ФИО: "
		fio = Employee.fio_convert(gets.chomp)
		puts "Введите дату рождения: "
		year = Employee.year_convert(gets.chomp)
		puts "Введите телефон: "
		tel = Employee.tel_convert(gets.chomp)
		puts "Введите адрес: "
		addr = gets.chomp
		puts "Введите e-mail: "
		email = Employee.email_convert(gets.chomp)
		puts "Введите паспортные данные: "
		pass = Employee.pass_convert(gets.chomp)
		puts "Введите специальность: "
		spec = gets.chomp
		puts "Введите опыт работы: "
		exp = gets.chomp
		if exp.to_i == 0
			employee_list.add_employee(Employee.new(fio, year, tel, addr, email, pass, spec, exp))
		else
			puts "Введите предыдущее место работы: "
			workplace = gets.chomp
			puts "Введите должность на предыдущем месте работы: "
			post = gets.chomp
			puts "Введите зарплату на предыдущем месте работы: "
			sal = gets.chomp
			employee_list.add_employee(Employee.new(fio, year, tel, addr, email, pass, spec, exp, workplace, post, sal))

	end

	def view_employees()
		puts employee_list
	end

	def search_employee()
		puts "Введите ФИО/e-mail/телефон/паспортные данные для поиска: "
		request = gets.chomp
		if Employee.fio_check?(request)
			puts employee_list.find_by_fio(request)
		elsif Employee.email_check?(request)
			puts employee_list.find_by_email(request)
		elsif Employee.tel_check?(request)
			puts employee_list.find_by_tel(request)
		elsif Employee.pass_check?(request)
			puts employee_list.find_by_pass(request)
		else
			puts "Сотрудник не найден."
	end

	def edit_employee()
		puts "Введите номер сотрудника для изменения. Всего сотрудников #{employee_list.size}: "
		pos = gets.chomp.to_i - 1
		while true
			puts "1. Изменить ФИО.\n2. Изменить дату рождения.\n3. Изменить телефон.\n4. Изменить адрес.\n5. Изменить email.
			6. Изменить паспортные данные.\n7. Изменить специальность.\n8. Изменить опыт работы.\n9. Изменить предыдущее место работы.
			10. Изменить должность на предыдущем месте работы.\n11. Изменить зарплату на предыдущем месте работы.
			12. Выход."
			op = gets.chomp.to_i
			case op
			when 1
				puts "Введите новые ФИО: "
				employee_list.edit_employee(pos, op, Employee.fio_convert(gets.chomp))
			when 2
				puts "Введите новую дату рождения: "
				employee_list.edit_employee(pos, op, Employee.year_convert(gets.chomp))
			when 3
				puts "Введите новый телефон: "
				employee_list.edit_employee(pos, op, Employee.tel_convert(gets.chomp))
			when 5
				puts "Введите новый e-mail: "
				employee_list.edit_employee(pos, op, Employee.email_convert(gets.chomp))
			when 6
				puts "Введите новые паспортные данные: "
				employee_list.edit_employee(pos, op, Employee.pass_convert(gets.chomp))
			when 4, 7, 8, 9, 10, 11
				puts "Введите новую специальность: "
				employee_list.edit_employee(pos, op, gets.chomp)
			when 12
				break
		end
	end

	def delete_employee()
		puts "Введите номер сотрудника для удаления. Всего сотрудников #{employee_list.size}: "
		pos = gets.chomp.to_i - 1
		employee_list.delete_employee(pos)
	end

	def save_changes(addr)
		employee_list.write_to_file(addr)
		puts "Данные успешно сохранены в файл #{addr}."
	end

	def sort_employees()
		puts "Отсортировать по:\n1. ФИО.\n2. Дате рождения.\n3. Телефону.\n4. Адресу.\n5. Email.
			6. Паспортные данным.\n7. Специальности.\n8. Опыту работы.\n9. Предыдущему месту работы.
			10. Должности на предыдущем месте работы.\n11. Зарплате на предыдущем месте работы."
		employee_list.sort_list(gets.chomp.to_i)
		
	end

end

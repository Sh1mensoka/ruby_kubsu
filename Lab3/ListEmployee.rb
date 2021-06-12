c_r = File.dirname(__FILE__)
require "#{c_r}/Employee.rb"

class ListEmployee

	def initialize()
		@employee_list= Array.new()
	end

	def add_employee(employee)
		@employee_list << employee
	end

	def edit_employee(pos, op, str)
		case op
		when 1
			@employee_list[pos].fio = str
		when 2
			@employee_list[pos].year = str
		when 3
			@employee_list[pos].tel = str
		when 4
			@employee_list[pos].addr = str
		when 5
			@employee_list[pos].email = str
		when 6
			@employee_list[pos].pass = str
		when 7
			@employee_list[pos].spec = str
		when 8
			@employee_list[pos].exp = str
		when 9
			@employee_list[pos].workplace = str
		when 10
			@employee_list[pos].post = str
		when 11
			@employee_list[pos].sal = str

	def delete_employee(pos)
		@employee_list.delete_at(pos)
	end

	def to_s()
		employee = ""
		@employee_list.each {|x| employee.concat("#{x}\n\n")}
		"Сотрудники:\n\n#{employee}"
	end

	def write_to_file(addr)
		file_to_write = File.new("#{addr}", "r+")
		@employee_list.each {|x| file_to_write.syswrite("#{x}\n\n")}
		file_to_write.close
	end

	def read_from_file(addr)
		file_to_read = File.new("#{addr}", "r")
		strings = file_to_read.readlines()
		strings.delete("\n")
		ind = 0
		while (ind != strings.size)
			fio = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			year = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			tel = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			addr = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			email = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			pass = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			spec = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			exp = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			workplace = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			post = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			sal = strings[ind][/[А-Яа-я\s\w@.-]*\n/].delete_prefix(" ").chomp
			ind += 1
			self.add_employee(Employee.new(fio, year, tel, addr, email, pass, spec, exp, workplace, post, sal))
		end
		file_to_read.close
	end

	def find_by_fio(fio)
		@employee_list.each {|x| x if x.fio.eql?(Employee.fio_convert(fio))}
	end

	def find_by_email(email)
		@employee_list.each {|x| x if x.email.eql?(Employee.email_convert(email))}
	end

	def find_by_tel(tel)
		@employee_list.each {|x| x if x.tel.eql?(Employee.tel_convert(tel))}
	end

	def find_by_pass(pass)
		@employee_list.each {|x| x if x.pass.eql?(Employee.pass_convert(pass))}
	end

	def sort_list(op)
		case op
		when 1
			@employee_list.sort_by! {|employee| @employee_list.fio}
		when 2
			@employee_list.sort_by! {|employee| @employee_list.year}
		when 3
			@employee_list.sort_by! {|employee| @employee_list.tel}
		when 4
			@employee_list.sort_by! {|employee| @employee_list.addr}
		when 5
			@employee_list.sort_by! {|employee| @employee_list.email}
		when 6
			@employee_list.sort_by! {|employee| @employee_list.pass}
		when 7
			@employee_list.sort_by! {|employee| @employee_list.spec}
		when 8
			@employee_list.sort_by! {|employee| @employee_list.exp}
		when 9
			@employee_list.sort_by! {|employee| @employee_list.workplace}
		when 10
			@employee_list.sort_by! {|employee| @employee_list.post}
		when 11
			@employee_list.sort_by! {|employee| @employee_list.sal}
end
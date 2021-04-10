class Employee

	def initialize(fio, year, tel, addr, email, pass, spec, exp, workplace, sal)
		self.fio= fio
		self.year= year
		self.tel= tel
		self.addr= addr
		self.email= email
		self.pass= pass
		self.spec= spec
		self.exp= exp
		self.workplace= workplace
		self.sal= sal
	end

	def fio
		@fio
	end

	def year
		@year
	end

	def tel
		@tel
	end

	def addr
		@addr
	end

	def email
		@email
	end

	def pass
		@pass
	end

	def spec
		@spec
	end

	def exp
		@exp
	end

	def workplace
		@workplace
	end

	def sal
		@sal
	end

	def fio=(fio)
		@fio = fio
	end

	def year=(year)
		@year = Employee.year_convert(year)
	end

	def tel=(tel)
		@tel = Employee.tel_convert(tel)
	end

	def addr=(addr)
		@addr = addr
	end

	def email=(email)
		@email = Employee.email_convert(email)
	end

	def pass=(pass)
		@pass = Employee.pass_convert(pass)
	end

	def spec=(spec)
		@spec = spec
	end

	def exp=(exp)
		@exp = exp
	end

	def workplace=(workplace)
		@workplace = workplace
	end

	def sal=(sal)
		@sal = sal
	end

	def to_s
		"ФИО: #{@fio}\nГод рождения: #{@year}\nТелефон: #{@tel}\nАдрес: #{@addr}\nE-mail: #{@email}\nПаспортные данные: #{pass}
Специальность: #{@spec}\nСтаж работы: #{@exp}\nПредыдущее место работы: #{@workplace}\nЗарплата на предыдущем месте работы: #{@sal}"	
	end

	def self.tel_check?(tel)
		if tel =~ /^(8|\+7)([\W]*\d){10}$/ 
			true
		else 
			false
		end
	end

	def self.tel_convert(tel)
		if !self.tel_check?(tel)
			raise "Некорректный номер телефона!"
		else
			str = ""
			tel.scan(/\d/){|x| str.concat(x)}
			str[0] = '7'
			str.insert(1, '-')
			str.insert(5, '-')
			str
		end
	end

	def self.email_check?(email)
		if email =~ /^[\w]*+@[\w]*+\.+[A-Za-z]{2,3}$/
			true
		else
			false
		end
	end

	def self.email_convert(email)
		if !self.email_check?(email)
			raise "Некорректный адрес электронной почты!" 
		else
			email.downcase
		end
	end

	def self.fio_check?(fio)
		if fio =~ /^ *[А-Яа-я]* *-? *[А-Яа-я]* *[А-Яа-я]* *-? *[А-Яа-я]* *[А-Яа-я]* *[А-Яа-я]* */
			true
		else
			false
		end
	end

	def self.fio_convert(fio)
		if !self.fio_check?(fio)
			raise "Некорректные имя фамилия отчество!"
		else
			# TODO
		end
	end


	def self.year_check?(year)
		if year =~ /^\d{1,2}.\d{1,2}.\d{2,4}/
			temp = year.split(".")
			case temp[1].to_i
			when 1, 3, 5, 7, 8, 10, 12
				if temp[0].to_i > 0 && temp[0].to_i < 32
					true
				else
					false
				end
			when 2
				if temp[0].to_i > 0 && temp[0].to_i < 29
					true
				else
					false
				end	
			when 4, 6, 9, 11
				if temp[0].to_i > 0 && temp[0].to_i < 31
					true
				else
					false
				end	
			else
				false
			end
		else
			false
		end
	end

	def self.year_convert(year)
		if !self.year_check?(year)
			raise "Некорректный год!"
		else
			temp = year.split(".")
			if temp[0].length < 2
				temp[0].insert(0, "0")
			end
			if temp[1].length < 2
				temp[1].insert(0, "0")
			end
			new_year = "#{temp[0]}.#{temp[1]}.#{temp[2]}"
		end
	end

	def self.pass_check?(pass)
		if pass =~ /^\d{4} ?\d{6}/
			true
		else
			false
		end
	end

	def self.pass_convert(pass)
		if !self.pass_check?(pass)
			raise "Некорректные паспортные данные!"
		else
			if pass.split(" ").length < 2
				pass.insert(4, " ")
			end
			pass
		end
	end

	def self.test_class()

	end
end
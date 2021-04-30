class Employee

	attr_accessor :fio, :year, :tel, :addr, :email, :pass, :spec, :exp, :workplace, :post, :sal

	def initialize(fio, year, tel, addr, email, pass, spec, exp, *args)
		self.fio= fio
		self.year= year
		self.tel= tel
		self.addr= addr
		self.email= email
		self.pass= pass
		self.spec= spec
		self.exp= exp
		self.workplace= ""
		self.post= ""
		self.sal= ""

		if args.size > 0
			self.workplace, self.post, self.sal = args
		end
		
	end

	def fio=(fio)
		@fio = Employee.fio_convert(fio)
	end

	def year=(year)
		@year = Employee.year_convert(year)
	end

	def tel=(tel)
		@tel = Employee.tel_convert(tel)
	end

	def email=(email)
		@email = Employee.email_convert(email)
	end

	def pass=(pass)
		@pass = Employee.pass_convert(pass)
	end

	def to_s
		"ФИО: #{@fio}\nГод рождения: #{@year}\nТелефон: #{@tel}\nАдрес: #{@addr}\nE-mail: #{@email}\nПаспортные данные: #{@pass}
Специальность: #{@spec}\nСтаж работы: #{@exp}\nПредыдущее место работы: #{@workplace}\nДолжность на предыдущем месте работы: #{@post}
Зарплата на предыдущем месте работы: #{@sal}"	
	end

	def self.tel_check?(tel)
		if tel =~ /^(8|\+?7)([\W]*\d){10}$/ 
			true
		else 
			false
		end
	end

	def self.tel_convert(tel)
		begin
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
		rescue
			print("\nВведите корректный номер телефона:")
			tel = $stdin.gets.chomp
			retry
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
		begin
			if !self.email_check?(email)
				raise "Некорректный адрес электронной почты!" 
			else
				email.downcase
			end
		rescue
			print("\nВведите корректный email:")
			email = $stdin.gets.chomp
			retry
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
		begin
			if !self.fio_check?(fio)
				raise "Некорректные имя фамилия отчество!"
			else
				temp = fio.downcase.split(/(-)/).map{|x| x.split(" ")}.flatten.map{|x| x.capitalize}
				i = 0
				result = ""
				while i < temp.size
					case temp[i+1]
					when "-"
						result << temp[i] << temp[i+1]
						i += 2
					else
						if i == temp.size - 1
							result << temp[i]
						else
							result << temp[i] << " "
						end
					i += 1
					end
				end
				if result.count(" ") > 2
					result[result.rindex(" ") + 1..result.size] = result[result.rindex(" ") + 1..result.size].downcase
				end
				result
			end
		rescue
			print("\nВведите корректные ФИО:")
			fio = $stdin.gets.chomp
			retry
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
		begin
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
		rescue
			print("\nВведите корректную дату рождения:")
			year = $stdin.gets.chomp
			retry
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
		begin
			if !self.pass_check?(pass)
				raise "Некорректные паспортные данные!"
			else
				if pass.split(" ").length < 2
					pass.insert(4, " ")
				end
				pass
			end
		rescue
			print("\nВведите корректные паспортные данные:")
			pass = $stdin.gets.chomp
			retry
		end
	end
end
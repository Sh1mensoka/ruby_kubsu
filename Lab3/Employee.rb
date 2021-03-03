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
		@year = year
	end

	def tel=(tel)
		@tel = tel
	end

	def addr=(addr)
		@addr = addr
	end

	def email=(email)
		@email = email
	end

	def pass=(pass)
		@pass = pass
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

end
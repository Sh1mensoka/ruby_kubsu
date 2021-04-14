c_r = File.dirname(__FILE__)
require "#{c_r}/Employee.rb"

person = Employee.new(" Салтыков - щЕдрин Иван-Руслан Ахмед Заде", "8.2.2012", "+7(918)275-52-10", "dkdhjgr", "not_ReGuLaR@mAIL.com", "0312210418", 34, "dttjhg", "gdth", 45)

puts person
# person.tel=("8(918)294-1333")
# person.email=("regular@regular.ru")
# person.year=("14.12.1998")
# person.pass=("2113 210418")
person.fio=("Иванов Иван   ИваноВиЧ")
puts person
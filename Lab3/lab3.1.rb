c_r = File.dirname(__FILE__)
require "#{c_r}/Employee.rb"

person = Employee.new("sfjkgh", 38454, "+7(918)275-52-10", "dkdhjgr", "not_ReGuLaR@mAIL.com", "dth", 34, "dttjhg", "gdth", 45)
puts person
# puts Employee.tel_check?(person.tel)
# Employee.tel_convert(person.tel)
person.tel=("8(918)294-1333")
person.email=("regular@regular.ru")
puts person
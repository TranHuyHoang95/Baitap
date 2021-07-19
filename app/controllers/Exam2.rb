class Student 
  attr_accessor :name, :birthday, :math, :liter,:eng,:avg

  def initialize ( name, birthday, math, liter,eng, avg)
    @name = name
    @birthday = birthday
    @math = math
    @liter = liter
    @eng = eng
    @avg = avg
  end

  def create_score_hash
    keys = [:math,:liter,:eng,:avg]
    values = keys.map{|key| send key }
    hash = keys.zip(values).to_h
  end 
  
end
class Class
  def initialize
    @students_list =[]
  end

  def check_Number(value)
    if (value ==value.to_f.to_s || value == value.to_i.to_s)
        return true
    else 
        return false   
    end
  end
#  Create Input 
  def input 
    begin
      print "Please enter the number of students in the class: "
      num_of_student = gets.chomp
      if !check_Number(num_of_student)
         puts "Error! Input is not a number!" 
      end
    end while !check_Number(num_of_student)
   
    puts "Enter students's information!".rjust(50)
    for i in 1..num_of_student.to_i
        puts "Student #{i}"
        print "Name: ".rjust(15)
        name = gets.chomp
        begin
            print "Birthday: ".rjust(15)
            birthday = gets.chomp
            
            if !check_Number(birthday)
                puts "Error! Input is not a number! Please try again!" 
            end
        end while !check_Number(birthday)

        begin
            print "Math: ".rjust(15)
            math = gets.chomp
            
            if  !check_Number(math)
                puts "Error! Input is not a number! Please try again!"  
            end
        end while !check_Number(math)
        begin
            print "Literature: ".rjust(15)
            liter = gets.chomp
            if  !check_Number(liter)
                puts "Error! Input is not a number! Please try again!"  
           end   
        end while !check_Number(liter)

        begin
            print "English: ".rjust(15)
            eng = gets.chomp
            if  !check_Number(eng)
                puts "Error! Input is not a number! Please try again!"  
            end
        end while !check_Number(eng)
        math = math.to_f
        liter = liter.to_f
        eng = eng.to_f
        avg = (math+eng+liter)/3
        student = Student.new(name,birthday,math,liter,eng,avg)
        @students_list.push(student)
    end
   
  end
  # End Create Input
  # Find Max
  def find_max
  # Use method: stu_max = @students_list.max_by{|x| x.avg}
    max =0
    for i in 0..(@students_list.length-1) 
      if @students_list[i].avg > max
        max = @students_list[i].avg
        stu_max = @students_list[i]
      end
    end
    puts "Student who has max avg".center(30)
    puts "Name: #{stu_max.name}".rjust(20)
    puts "Birthday: #{stu_max.birthday}".rjust(20)
    puts "Math: #{stu_max.math}".rjust(20)
    puts "Literature: #{stu_max.liter}".rjust(20)
    puts "English: #{stu_max.eng}".rjust(20)
    puts "AVG: #{stu_max.avg}".rjust(20)
  end
  # End Find Max
  # Create Class's Hash
  def create_hash_class 
    hash_class = {}
    @students_list.select do |student|
      hash_class[student.name] = student.create_score_hash
    end
    puts "Class's Hash: #{hash_class}"
  end
end
run = Class.new
run.input
run.find_max
run.create_hash_class
class Student
    attr_accessor :name, :address, :maths, :literature, :english, :avg_score
  
    def initialize(name, address, maths, literature, english, avg_score)
      @name = name
      @address = address
      @maths = maths
      @literature = literature
      @english = english
      @avg_score = avg_score
    end
  
    def hash_score
      subjects = [:maths, :literature, :english, :avg_score]
      values = subjects.map{|subject| send subject }
      hash = {}
      subjects.zip(values){|subject, value| hash[subject] = value}
      hash
    end
  end
  
  class ClassRoom
  
    def initialize
      @list_score_student = []
    end
  
    def input_info_student
      puts "The number of student: "
      number_student = gets.chomp.to_i
      while number_student > 0
        puts "Name student: "
        name = gets.chomp.to_s
        puts "Address student: "
        address = gets.chomp.to_s
        puts "Maths student: "
        maths = gets.chomp.to_f
        puts "Literature student: "
        literature = gets.chomp.to_f
        puts "English student: "
        english = gets.chomp.to_f
        avg_score = (maths + literature + english) / 3
        score_student = Student.new(name, address, maths, literature, english, avg_score)
        @list_score_student.push(score_student)
  
        number_student -= 1
      end
      puts "#{@list_score_student}"
    end
  
    def print_information_student 
      @list_score_student.each do |s| 
        puts "Student Name: #{s.name}"
        puts "Student Address: #{s.address}"
        puts "Student Maths: #{s.maths}"
        puts "Student Literature: #{s.literature}"
        puts "Student English: #{s.english}"
        puts "Student Average Score: #{s.avg_score}"
      end
    end
  
    def print_max_avg
      max =  @list_score_student.max_by {|e| e.avg_score }
      puts "Student Name Max: #{max.name}"
      puts "Student Address Max: #{max.address}"
      puts "Student Maths Max: #{max.maths}"
      puts "Student Literature Max: #{max.literature}"
      puts "Student English Max: #{max.english}"
      puts "Student Average Score Max: #{max.avg_score}"
    end
  
    def print_hash_list_student
      hash_student = {}
      @list_score_student.map do |student| 
        hash_student[student.name] = student.hash_score
      end
      puts "Student: #{hash_student}"
    end
  
  end
  
  sc = ClassRoom.new
  sc.input_info_student
  sc.print_information_student
  sc.print_max_avg
  sc.print_hash_list_student
exam = "Bài 1"

# ========1.1=========
puts " #{exam.center(50)}"
a = []

puts "Nhập giá trị cho mảng"
(0..4).each do |i|
		print "a[#{i}]="
		a[i] = gets.chomp.to_i	
	end
puts "- Mảng vừa nhập là: #{a}"
# ====== End 1.1 =======

# ======== 1.2 =========
puts "- Tổng các phần tử trong mảng: #{a.inject{|sum,e| sum +=e}}"

# ====== End 1.2 =======

# ======== 1.3 =========

# def map!(proc_object)
# 	self.each_with_index do |value,index|
# 		self[index] = proc_object.call(value)
# 	end
# end
squared = Proc.new do|val| 
	if val !=6 && val != 7
		val = val **2
	else val = val
	end
end

puts "- Mảng sau khi luỹ thừa: #{a.map!(&squared)}"
# ====== End 1.3 ======


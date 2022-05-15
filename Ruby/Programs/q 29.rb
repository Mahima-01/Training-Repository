# 29.Write a function which takes roman number and return integer corresponding to that roman number. 
class Integer
  def to_roman
    num = self
    str = ""
    value_sets = {"1000"=>"M","900"=>"CM","500"=>"D","400"=>"CD","100"=>"C","90"=>"XC","50"=>"L","40"=>"XL","10"=>"X","9"=>"IX","5"=>"V","4"=>"IV","1"=>"I"}
    value_sets.each do |arabic,roman|
      quotient = num/arabic.to_i
      num = num%arabic.to_i
      str << roman*quotient
    end
    str
  end
end
puts ARGV[0].to_i.to_roman

Output:
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb 23
XXIII
itsacheckmate@itsacheckmate:~/Training-Repository/Rvm_Ruby$ ruby Ruby.rb 115
CXV

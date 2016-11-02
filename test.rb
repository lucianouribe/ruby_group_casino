@dealer = [12, 23]

puts @dealer.inject(0){|sum,x| sum + x }

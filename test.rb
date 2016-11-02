
array_02 = (1..4).to_a

array_04 = (1...4).to_a
puts array
puts array_02
puts array_03
puts array_04


@ranks = ['A', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K']
#  @ranks = [1,2,3,4,5,6,7,8,9,10, 11, 12, 13]
@suits = %w(Spades Diamonds Clubs Hearts)
#  @color = %w(Red Black)
@cards = []
generate_deck
end

def generate_deck
@suits.each do |suit|
  @ranks[1..9].size.times do |i|
    color = (i % 2 == 0) ? 'Black' : 'Red'
    @cards << Card.new(@ranks[i], suit, color)
  end
  ['J', 'Q', 'K', 'A'].each do |i|
    color = (i % 2 == 0) ? 'Black' : 'Red'
    @cards << Card.new(@ranks[i], suit, color)
  end
end
deal

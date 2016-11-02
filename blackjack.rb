

# @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
@ranks = [1,2,3,4,5,6,7,8,9,10, 11, 12, 13]
@suits = %w(Spades Diamonds Clubs Hearts)
@dealer = []
@gamer = []
  def start
    puts "--- Black Jack ---\n"
    # puts "Welcome to Black Jack: #{player.name.capitalize}"
    # puts "You have $#{player.bank_roll} dollars to play with!"
    # @player = player
    puts "[1] Play"
    puts "[2] Main Menu"
    choice = gets.strip
    place_the_bet if choice == '1'
  end

  def place_the_bet
    puts "Place your bet"
    # choice
    # @bet = gets.strip.to_i
    # if @bet > @player.bank_roll
    #   puts 'Not enough money!'
    #   place_the_bet
    # else
      dealing_process
    # end
  end

def dealing_process
  puts "The dealer deals the cards..."; sleep 0
  deal
  deal_01 = @card
  @dealer << deal_01
  deal
  deal_02 = @card
  @dealer << deal_02
  deal
  deal_03 = @card
  @gamer << deal_03
  deal
  deal_04 = @card
  @gamer << deal_04
  # puts @card
  puts "#{@dealer[0]} #{@dealer[1]}"
  @dealer_sum = @dealer[0] + @dealer[1]
  puts "Thats equal to: #{@dealer_sum}"
  puts "#{@gamer[0]} #{@gamer[1]}"
  @gamer_sum = @gamer[0] + @gamer[1]
  puts "Thats equal to: #{@gamer_sum}"
  # @gamer.flatten!
  # split_operation = @gamer.split(/(Hearts|Diamonds|Clubs|Spades)/)
  # puts split_operation
  value_giver
end

  def deal
    temp_rank = @ranks.clone
    temp_suit = @suits.clone

    suit_pick = temp_suit.sample
    rank_pick = temp_rank.sample

    @card = rank_pick
  end

# def value_giver
#   @gamer_total = 0
# case @gamer
# when 'A'
#   @gamer_value = 1
# when '2'
#   @gamer_value = 2
# when '3'
#   @gamer_value = 3
# when '4'
#   @gamer_value = 4
# when '5'
#   @gamer_value = 5
# when '6'
#   @gamer_value = 6
# when '7'
#   @gamer_value = 7
# when '8'
#   @gamer_value = 8
# when '9'
#   @gamer_value = 9
# when '10'
#   @gamer_value = 10
# when 'J'
#   @gamer_value = 10
# when 'Q'
#   @gamer_value = 10
# when 'K'
#   @gamer_value = 10
# end
# @gamer_total = @gamer_value
# end
# # def value_giver
#   puts @gamer
#   @gamer = @gamer.to_s
#   # @gamer = @gamer.join
#   # @gamer.include? "A10"
#   # @gamer.gsub!(/A10/, 21)
#   # @gamer.include? "AJ"
#   # @gamer.gsub!(/AJ/, 21)
#   # @gamer.include? "AQ"
#   # @gamer.gsub!(/AQ/, 21)
#   # @gamer.include? "AK"
#   # @gamer.gsub!(/AK/, 21)
#   @gamer.include? "A"
#   @gamer.gsub!(/A/, 1)
#   @gamer.include? "2"
#   @gamer.gsub!(/2/, 2)
#   @gamer.include? "3"
#   @gamer.gsub!(/3/, 3)
#   @gamer.include? "4"
#   @gamer.gsub!(/4/, 4)
#   @gamer.include? "5"
#   @gamer.gsub!(/5/, 5)
#   @gamer.include? "6"
#   @gamer.gsub!(/6/, 6)
#   @gamer.include? "7"
#   @gamer.gsub!(/7/, 7)
#   @gamer.include? "8"
#   @gamer.gsub!(/8/, 8)
#   @gamer.include? "9"
#   @gamer.gsub!(/9/, 9)
#   @gamer.include? "10"
#   @gamer.gsub!(/10/, 10)
#   @gamer.include? "J"
#   @gamer.gsub!(/J/, 10)
#   @gamer.include? "Q"
#   @gamer.gsub!(/Q/, 10)
#   @gamer.include? "K"
#   @gamer.gsub!(/K/, 10)
#
#   puts @gamer
# end
#
#
start

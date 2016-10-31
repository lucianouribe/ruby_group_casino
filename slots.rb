class Slots
  attr_accessor :player

  def initialize(player)
    puts "Welcome to Slots: #{player.name}"
    puts "You have #{player.bank_roll} dollars to play with!"
    @player = player
    place_the_bet
  end

  def place_the_bet
    puts "Place your bet"
    # choice
    @bet = gets.strip.to_i
    # @bank_roll = @bank_roll - bet
    # puts "Remaining bank #{@bank_roll - @temp_array}"
    rolling_slots
  end

  def rolling_slots
    slot_01 = ['A', 'B', 'C']
    slot_02 = ['A', 'B', 'C']
    slot_03 = ['A', 'B', 'C']


    puts "Slot machine working"
    option_01 = slot_01[rand(0..2)]; sleep 0
    print option_01
    option_02 = slot_02[rand(0..2)]; sleep 0
    print option_02
    option_03 = slot_03[rand(0..2)]; sleep 0
    print option_03

    if option_01 == option_02 == option_03
      puts "Jackpot!!!!"
    elsif option_01 == option_02 != option_03
      puts "You get what you bet"
    elsif option_01 == option_03 != option_02
      puts "You get what you bet"
    elsif option_02 == option_03 != option_01
      puts "You get what you bet"
    else
      puts "Your money is mine!!!"
    end
    # win_or_loose_situation
  end

  # def win_or_loose_situation
  #
  # end
end

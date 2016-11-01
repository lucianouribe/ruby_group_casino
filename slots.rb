require 'pry'
class Slots
  attr_accessor :player

  def initialize(player)
    puts "--- Slots ---\n".colorize(:blue)
    puts "Welcome #{player.name.capitalize}"
    puts "You have $#{player.bank_roll} dollars to play with!\a"
    @player = player
    place_the_bet
  end

  def place_the_bet
    puts "Place your bet"
    @bet = gets.strip.to_i
    if @bet > @player.bank_roll
      puts "Not enough money!\a".colorize(:color => :red, :background => :yellow)
      place_the_bet
    else
      rolling_slots
    end
  end

  def rolling_slots
    slot_01 = ['A', 'K', 'Q', 'J', '10', '9']
    slot_02 = ['A', 'K', 'Q', 'J', '10', '9']
    slot_03 = ['A', 'K', 'Q', 'J', '10', '9']
    temp = []

    puts "Slot machine working"; sleep 1
    option_01 = slot_01[rand(0..5)]
    temp << option_01
    print " " + option_01.colorize(:yellow)
    option_02 = slot_02[rand(0..5)]
    temp << option_02
    print " " + option_02.colorize(:blue); sleep 1
    option_03 = slot_03[rand(0..5)]
    temp << option_03
    puts " " + option_03.colorize(:red); sleep 1
    temp = temp.uniq
    temp = temp.count


    if temp == 1
      puts "Jackpot!!!!".colorize(:green)
      @player.bank_roll = @player.bank_roll + (@bet * 2)
      @player.punctuation = @player.punctuation + 1
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif temp == 2
      puts "You break even!".colorize(:yellow)
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    else
      puts "Your money is mine!!!".colorize(:red)
      @player.bank_roll = @player.bank_roll - @bet
      @player.punctuation = @player.punctuation - 1
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    end
    players_choice
  end

  def players_choice
    puts "Do you want to continue playing this game?"
    answer = gets.strip.downcase
    place_the_bet if answer.include?('y')
      # call roll_1 again instead of initialize
  end
end

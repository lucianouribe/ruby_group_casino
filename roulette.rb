require 'pry'
class Roulette
  attr_accessor :player


  def initialize(player)
    puts "\n--- Ruuuuuby Roulette ---\n".colorize(:blue); sleep 1
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
      exit
    else
      puts "[1] To bet for colors"
      puts "[2] To bet for numbers"
      puts "[3] Main Menu"
      choice = gets.strip.to_i
      if choice == 1
        puts "[1] Red"
        puts "[2] Black"
        print ">> "
        @color_bet = gets.strip.to_i
        rolling_slots

      elsif choice == 2
        puts "Pick number [1 - 36]"
        print ">> "
        @num_bet =gets.strip.to_i
        rolling_slots
      else
      end
    end

  end


  def rolling_slots
    # roulette_spots = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36]
    roulette_spots = (1..36).to_a

    puts "Roooooollling"
    @loose_win = roulette_spots.sample
    color_test = @loose_win % 2
    if color_test == 0
      @color = 2
      puts "#{@loose_win} black"
    else
      @color = 1
      puts "#{@loose_win} red"
    end
    win_loose_method
  end
  def win_loose_method
    if @loose_win == @num_bet
      puts "You win!!!!".colorize(:green)
      @player.bank_roll = @player.bank_roll + (@bet * 36)
      @player.punctuation = @player.punctuation + 5
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif @color == @color_bet
      puts "You win!!!!".colorize(:green)
      @player.bank_roll = @player.bank_roll + @bet
      @player.punctuation = @player.punctuation + 1
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif @loose_win != @num_bet
      puts "You loose!!!!".colorize(:red)
      @player.bank_roll = @player.bank_roll - @bet
      @player.punctuation = @player.punctuation - 1
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif @color != @color_bet
      puts "You loose!!!!".colorize(:red)
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
  end
end

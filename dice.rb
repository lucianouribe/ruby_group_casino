  require 'pry'

class Dice

  attr_accessor :player


  def initialize(player)
    puts """

               (( _______
     _______     /\\O    O\\
    /O     /\\   /  \\      \\
   /   O  /O \\ / O  \\O____O\\ ))
((/_____O/    \\    /O     /
  \\O    O\\    / \\  /   O  /
   \\O    O\\ O/   \\/_____O/
    \\O____O\\/ ))          ))
  ((
    """.colorize(:blue)
    puts "\n--- Dice Game ---\n".colorize(:blue); sleep 1
    puts "Welcome #{player.name.capitalize}"
    puts "You have $#{player.bank_roll} dollars to play with!\a"
    @player = player
    puts "[1] Play"
    puts "[2] Main Menu"
    choice = gets.strip
    place_the_bet if choice == '1'
  end

  def place_the_bet
    puts "Place your bet"
    @bet = gets.strip.to_i
    if @bet > @player.bank_roll
      puts "Not enough money!\a".colorize(:color => :red, :background => :yellow)
      TooHatedWellsFargo.new(player)
    else
      puts "[1] To bet for Odds & Even"
      puts "[2] To bet for numbers"
      puts "[3] Main Menu"
      choice = gets.strip.to_i
      if choice == 1
        puts "[1] Odds"
        puts "[2] Even"
        print ">> "
        @color_bet = gets.strip.to_i
        rolling_dice

      elsif choice == 2
        puts "Pick number [1 - 12]"
        print ">> "
        @num_bet =gets.strip.to_i
        rolling_dice
      else
      end
    end

  end


  def rolling_dice
    roulette_spots = (1..12).to_a

    puts "Diiiiicccccceeeee!!!! (not you, the wierd cubes)"; sleep 1
    @loose_win = roulette_spots.sample
    color_test = @loose_win % 2
    if color_test == 0
      @color = 2
      puts "#{@loose_win} Even"
    else
      @color = 1
      puts "#{@loose_win} Odds"
    end
    win_loose_method
  end
  def win_loose_method
    if @loose_win == @num_bet
      puts "You win!!!!".colorize(:green)
      @player.bank_roll = @player.bank_roll + (@bet * 12)
      @player.increment_punctuation
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif @color == @color_bet
      puts "You win!!!!".colorize(:green)
      @player.bank_roll = @player.bank_roll + @bet
      @player.increment_punctuation
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif @loose_win != @num_bet
      puts "You loose!!!!".colorize(:red)
      @player.bank_roll = @player.bank_roll - @bet
      @player.unincrement_punctuation
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif @color != @color_bet
      puts "You loose!!!!".colorize(:red)
      @player.bank_roll = @player.bank_roll - @bet
      @player.unincrement_punctuation
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

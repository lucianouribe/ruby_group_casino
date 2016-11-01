require 'pry'

@roulette_spots = [1..36]

@temp = 0

# THE QUESTION FUNCTION
def start #instead of start is initialize
  puts "\n--- Ruuuuuby Roulette ---\n"#.colorize(:blue); sleep 1
  # puts "Welcome #{player.name.capitalize}"
  # puts "You have $#{player.bank_roll} dollars to play with!\a"
  # @player = player
  place_the_bet
end

def place_the_bet
  puts "Place your bet"
  @bet = gets.strip
  puts "[1] To bet for colors"
  puts "[2] To bet for numbers"
  puts "[3] Main Menu"
  choice = gets.strip.to_i

  if choice == 1
    puts "[1] Red"
    puts "[2] Black"
    print ">> "
    @color_bet = gets.strip.to_i
    # if @bet > @player.bank_roll
    #   puts "Not enough money!\a".colorize(:color => :red, :background => :yellow)
    #   place_the_bet
    # else
    rolling_slots
    # end
  elsif choice == 2
    puts "Pick number [1 - 36]"
    print ">> "
    @num_bet =gets.strip.to_i
    # if @bet > @player.bank_roll
    #   puts "Not enough money!\a".colorize(:color => :red, :background => :yellow)
    #   place_the_bet
    # else
    rolling_slots
    # end
  else
  end
end

# TRIPLE MIXED RANDOM NUMBERS (THE DICE OF FORTUNE)
def rolling_slots
  loose_win = @roulette_spots.sample
  color_test = loose_win % 2
  if color_test == 0
    puts "#{loose_win} black"
  else
    puts "#{loose_win} red"
  end

  @temp = @temp + @bet # this is not temp but @player.bank_roll

  puts loose_win#.colorize(:red);
  puts "Now you have $#{@temp} and #{@temp} points" # this should be @player.bank_roll & @player.punctuation
  exit
end

# binding.pry


while true
  start
end
binding.pry

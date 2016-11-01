require 'pry'

@answer_list = [
  -20,
  -10,
  -5,
  0,
  5,
  10,
  20,
  50
]

@temp = 0

# THE QUESTION FUNCTION
def start
  puts "\n--- Welcome to the Lucky Unlucky Bastard Roulette ---\n"#.colorize(:blue); sleep 1
  puts "Annnnnnd...."; sleep 1
  puts "There we gooooo..."
    roll_the_dice
end
# TRIPLE MIXED RANDOM NUMBERS (THE DICE OF FORTUNE)
def roll_the_dice
  numbers = [0..9]
  loose_win = @answer_list.shuffle[rand(5) + rand(5)]
  @temp = @temp + loose_win # this is not temp but @player.bank_roll
  puts loose_win#.colorize(:red);
  puts "Now you have $#{@temp} and #{@temp} points" # this should be @player.bank_roll & @player.punctuation
  exit
end

# binding.pry


while true
  start
end

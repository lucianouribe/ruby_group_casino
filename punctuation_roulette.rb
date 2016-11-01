require 'pry'

class LuckyRoulette
  attr_accessor :player

  def initialize(player)
    @player = player
    puts "\n--- Welcome to the Lucky Unlucky Bastard Roulette ---\n"#.colorize(:blue); sleep 1
    puts "Annnnnnd...."; sleep 1
    puts "There we gooooo..."
      roll_the_dice
  end
  # TRIPLE MIXED RANDOM NUMBERS (THE DICE OF FORTUNE)
  def roll_the_dice
    answer_list = [
      -20,
      -10,
      -5,
      0,
      5,
      10,
      20,
      50
    ]
    loose_win = answer_list.sample
    print "You win/loose this amount of money: "
    puts loose_win#.colorize(:red);
    @player.bank_roll = @player.bank_roll + loose_win
    @player.punctuation = 0
    puts "Sooo, after the Lucky Roulette..."; sleep 1
    puts "Back to the game...".colorize(:cyan)

  end

end

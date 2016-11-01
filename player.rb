require './punctuation_roulette'

class Player
  attr_accessor :name, :bank_roll, :punctuation

  def initialize
      puts "--- Players Options ---\n".colorize(:blue)
      options
  end

  def options
    puts "Players name"
    choice = gets.strip
    if choice == ''
      puts "Write a valid name"
      options
    else
      @name = choice
      puts "How much money do you have in your wallet?"
      choice = gets.strip.to_i
      @bank_roll = choice
      @punctuation = 0
    end
  end

  def increment_punctuation
    self.punctuation += 1
    if self.punctuation == 2
      LuckyRoulette.new(self)
    end
  end
  def unincrement_punctuation
    self.punctuation -= 1
    if self.punctuation == -2
      LuckyRoulette.new(self)
    end
  end
  # def win_lucky_roulette
  #   self.punctuation = 0
  #   @player.bank_roll = @player.bank_roll + @loose_win
  #   puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
  # end

end

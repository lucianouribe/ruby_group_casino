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



end


class Puntos
attr_accessor :player

  def initialize(player)
    @punctuation = 0
  end

  def puntuacion
    if @player.punctuation == 10
      @player.punctuation = 0
      lucky_roulette
    elsif @player.punctuation == -10
      @player.punctuation = 0
      unlucky_roulette
    end

  end
  def lucky_roulette
    puts "Here is the lucky roulette"
  end

  def unlucky_roulette
    puts "Here is the unlucky roulette"
  end

end

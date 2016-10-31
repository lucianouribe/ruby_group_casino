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
    end
  end
end

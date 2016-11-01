class TooHatedWellsFargo
  attr_accessor :player

  def initialize(player)
    @player = player
    puts "--- Wells Fargo Bank ---\n".colorize(:blue)
    puts "Hello #{@player.name.capitalize} We are here to serve you (screw you) and make your money disapear (as always)".colorize(:yellow)
    options
  end

  def options
    puts "You have $#{@player.bank_roll} in your wallet"
    puts "[1] Get more money"
    puts "[2] Cash out"
    puts "[3] Casino menu"
    choice = gets.strip
    case choice
      when '1'
        puts "How much do you want?"
        add_money = gets.strip.to_i
        @player.bank_roll = @player.bank_roll + add_money
        puts "Now your account has $#{@player.bank_roll} and #{@player.punctuation} points"
      when'2'
        puts "Cashing out..."; sleep 0
        puts "Take your $#{@player.bank_roll} and go away!"
        @player.bank_roll = 0
        puts "Have a nice day"
      when '3'

      else
        puts "Invalid option"
        puts "Try again"
        options
    end
  end
end

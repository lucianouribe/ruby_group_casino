class Highlow

  attr_accessor :player

  def initialize(player)
    puts "--- High & Low ---\n".colorize(:blue)
    puts "Welcome to High Low: #{player.name.capitalize}"
    puts "You have $#{player.bank_roll} dollars to play with!"
    @player = player
    puts "[1] Play"
    puts "[2] Main Menu"
    choice = gets.strip
    place_the_bet if choice == '1'
  end

  def place_the_bet
    puts "Place your bet"
    # choice
    @bet = gets.strip.to_i
    if @bet > @player.bank_roll
      puts 'Not enough money!'
      place_the_bet
    else
      roll_number_01
    end
  end

  def roll_number_01
    puts "Lets roll...".colorize(:purple); sleep 2
    @roll_1 = rand(1..10)
    puts @roll_1
    high_or_low
  end

  def high_or_low
    puts "Higher or lower?"
    @user_bet = gets.strip.downcase
    roll_number_02
  end

  def roll_number_02
    @roll_2 = rand(1..10)
    puts @roll_2
    outcome
  end

  def outcome
    if @user_bet.include?('hi')
      command = 'high'
      if @roll_1 < @roll_2
        puts "You won!!!".colorize(:green)
        @player.bank_roll = @player.bank_roll + @bet
        @player.punctuation = @player.punctuation + 1
        puts "Now you have $#{@player.bank_roll} and #{@player.punctuation} points"
        players_choice
      else
        puts "You loose!!!".colorize(:red)
        @player.bank_roll = @player.bank_roll - @bet
        @player.punctuation = @player.punctuation - 1
        puts "Now you have $#{@player.bank_roll} and #{@player.punctuation} points"
        players_choice
      end
    else
      command = 'low'
      if @roll_1 > @roll_2
        puts "You won!!!".colorize(:green)
        @player.bank_roll = @player.bank_roll + @bet
        @player.punctuation = @player.punctuation + 1
        puts "Now you have $#{@player.bank_roll} and #{@player.punctuation} points"
        players_choice
      else
        puts "You loose".colorize(:red)
        @player.bank_roll = @player.bank_roll - @bet
        @player.punctuation = @player.punctuation - 1
        puts "Now you have $#{@player.bank_roll} and #{@player.punctuation} points"
        players_choice
      end
    end
  end

  def players_choice
    puts "Do you want to continue playing this game?"
    answer = gets.strip.downcase
    place_the_bet if answer.include?('y')
  end

end

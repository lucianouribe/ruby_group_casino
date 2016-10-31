class Highlow
  # @temp_array = []
  attr_accessor :player

  def initialize(player)
    puts "Welcome to High Low: #{player.name}"
    puts "You have #{player.bank_roll} dollars to play with!"
    @player = player
    place_the_bet
  end

  def place_the_bet
    puts "Place your bet"
    # choice
    @bet = gets.strip.to_i
    # @bank_roll = @bank_roll - bet
    # puts "Remaining bank #{@bank_roll - @temp_array}"
    roll_number_01
  end

  def roll_number_01
    puts "Lets roll"; sleep 0
    @roll_1 = rand(1..100)
    puts @roll_1
    high_or_low
  end

  def high_or_low
    puts "Higher or lower?"
    @user_bet = gets.strip.downcase
    roll_number_02
  end

  def roll_number_02
    @roll_2 = rand(1..100)
    puts @roll_2
    outcome
  end

  def outcome
    if @user_bet.include?('hi')
      command = 'high'
      if @roll_1 < @roll_2
        puts "You won!!!".colorize(:green)
        @player.bank_roll = @player.bank_roll + @bet
        puts "Now you have #{@player.bank_roll}"
        players_choice
      else
        puts "You loose".colorize(:red)
        @player.bank_roll = @player.bank_roll - @bet
        puts "Now you have #{@player.bank_roll}"
        players_choice
      end
    else
      command = 'low'
      if @roll_1 > @roll_2
        puts "You won!!!".colorize(:green)
        # puts player.bank_roll + @temp_array
        @player.bank_roll = @player.bank_roll + @bet
        puts "Now you have #{@player.bank_roll}"
        players_choice
      else
        puts "You loose".colorize(:red)
        @player.bank_roll = @player.bank_roll - @bet
        puts "Now you have #{@player.bank_roll}"
        players_choice
      end
    end
  end

  def players_choice
    puts "Do you want to continue playing this game?"
    answer = gets.strip.downcase
    place_the_bet if answer.include?('y')
      # call roll_1 again instead of initialize
  end
end

require 'pry'

class Deck

  attr_accessor :player, :cards, :rank, :suit, :value

  def initialize(player)
   puts "--- Black Jack ---\n".colorize(:blue); sleep 1
   puts "Welcome #{player.name.capitalize}"
   puts "You have $#{player.bank_roll} dollars to play with!\a"
   @player = player
   @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
   @value = [11,2,3,4,5,6,7,8,9,10, 10, 10, 10]
   @suits = %w(Spades Diamonds Clubs Hearts)
   @color = %w(Red Black)
   @cards = []
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
     generate_deck
   end
  end

  def generate_deck
   @suits.each do |suit|
     @ranks.size.times do |i|
       value = @value[i]
       color = (i % 2 == 0) ? 'Black' : 'Red'
       @cards << Card.new(@ranks[i], suit, color, value)
     end
   end
   deal
  end

  def deal
    puts "Dealing..."; sleep 1
    @gamer = []
    @dealer = []
    @gamer << @cards.sample
    @gamer << @cards.sample
    @dealer << @cards.sample
    @dealer << @cards.sample

    @dealer_value = @dealer[0].value + @dealer[1].value
    @gamer_value = @gamer[0].value + @gamer[1].value
    puts "Dealer Cards".colorize(:yellow)
    puts "#{@dealer[0].rank} #{@dealer[0].suit}"
    puts "#{@dealer[1].rank} #{@dealer[1].suit}"
    # puts "Value: #{@dealer_value}"
    puts ""
    puts "Your cards!".colorize(:cyan)
    puts "#{@gamer[0].rank} #{@gamer[0].suit}"
    puts "#{@gamer[1].rank} #{@gamer[1].suit}"
    puts "Value: #{@gamer_value}"; sleep 1
    player_issue
  end

  def player_issue
    winning_issue
    puts "Your turn..."
    puts "--- Options ---"
    puts "[1] Hit"
    puts "[2] Stay"
    choice = gets.strip.to_i
    if choice == 1
      @gamer << @cards.sample
      @gamer_value = @gamer_value + @gamer[2].value
      puts "Your cards!".colorize(:cyan)
      puts "#{@gamer[0].rank} #{@gamer[0].suit}"
      puts "#{@gamer[1].rank} #{@gamer[1].suit}"
      puts "#{@gamer[2].rank} #{@gamer[2].suit}"
      puts "Value: #{@gamer_value}"; sleep 0
      player_issue
    elsif choice == 2
      dealer_issue
    end
  end

  def dealer_issue
    if @dealer_value < 17
      puts "Dealers turn"
      @dealer << @cards.sample
      @dealer_value = @dealer_value + @dealer[2].value
      puts "Dealer Cards".colorize(:yellow)
      puts "#{@dealer[0].rank} #{@dealer[0].suit}"
      puts "#{@dealer[1].rank} #{@dealer[1].suit}"
      puts "#{@dealer[2].rank} #{@dealer[2].suit}"
      puts "Value: #{@dealer_value}"
      dealer_issue
    elsif @dealer_value > 21
      puts "You win!!!!".colorize(:green)
      @player.bank_roll = @player.bank_roll + @bet
      @player.increment_punctuation
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    else
      if @dealer_value > @gamer_value
        puts "Your value...."; sleep 1
        puts "#{@gamer_value}"; sleep 1
        puts "Dealer value...."; sleep 1
        puts "#{@dealer_value}"; sleep 1
        puts ""
        puts "You loose!!!".colorize(:red)
        @player.bank_roll = @player.bank_roll - @bet
        @player.unincrement_punctuation
        puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
      else
        puts "Your value...."; sleep 1
        puts "#{@gamer_value}"; sleep 1
        puts "Dealer value...."; sleep 1
        puts "#{@dealer_value}"; sleep 1
        puts ""
        puts "You win!!!".colorize(:green)
        @player.bank_roll = @player.bank_roll + @bet
        @player.increment_punctuation
        puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
      end
    end
  players_choice
  end

  def winning_issue
    if @gamer_value > 21
      puts "Your money is mine!!!".colorize(:red)
      @player.bank_roll = @player.bank_roll - @bet
      @player.unincrement_punctuation
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    elsif @gamer_value == 21
      puts "Black Jack!!!".colorize(:gree)
      @player.bank_roll = @player.bank_roll + (@bet * 3)
      @player.increment_punctuation
      puts "You now have $ #{@player.bank_roll} and #{@player.punctuation} points".colorize(:light_blue)
    end
  end

  def players_choice
    puts "Do you want to continue playing this game?"
    answer = gets.strip.downcase
    place_the_bet if answer.include?('y')
  end
end

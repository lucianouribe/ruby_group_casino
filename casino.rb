require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'high_low'
require_relative 'slots'

class Casino
  attr_accessor :player

  def initialize
    @players = []
    puts "Welcome to the Ruby Casino!".colorize(:blue)
    users
  end

  def users
    puts "[1] New Player"
    puts "[2] Existing Player"
    choice = gets.strip
    if choice == '1'
      if @players.count <= 5
        @player = Player.new
        @players << @player
      else
        puts "This is not a stadium, it's a gambling game, just enough room for five! Too late! Go away!"
      end
    else
      @players.each_with_index { |x, i| puts "#{i + 1} #{x.name} #{x.bank_roll}" }
      puts "Choose player"
      pick_existing_player = gets.strip
      case pick_existing_player
        when '1'
          @player = @players[0]
        when '2'
          @player = @players[1]
        when '3'
          @player = @players[2]
        when '4'
          @player = @players[3]
        when '5'
          @player = @players[4]
      end
      puts "Ok #{@player.name} here we go!!!"
    end
    menu
  end

  def menu
    puts "Choose the game you want to play"
    # Pass player instance into each game / class that needed access to the player

    puts "[1] Highs and Lows"
    puts "[2] Slots"
    puts "[3] Players"
    puts "[4] Exit"
    choice = gets.strip
    case choice
      when '1'
        Highlow.new(player)
      when '2'
        Slots.new(player)
      when '3'
        users
      when '4'
        exit
      else
        puts "Learn how to write"
    end
    menu
  end
end

Casino.new #Calls casino class

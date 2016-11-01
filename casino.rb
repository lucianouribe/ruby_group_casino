require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'high_low'
require_relative 'slots'
require_relative 'wellsfargobank'
require_relative 'roulette'
# require_relative 'punctuation_roulette'

class Casino
  attr_accessor :player

  def initialize
    @players = []
    puts "--- Welcome to the Ruby Casino! ---\n".colorize(:blue)
    users
  end

  def users
    puts "--- Users ---\n"
    puts "[1] New Player"
    puts "[2] Existing Player"
    choice = gets.strip
    if choice == '1'
      if @players.count <= 4
        @player = Player.new
        @players << @player
      else
        puts "This is not a stadium, it's a gambling game"; sleep 1
        puts "Just enough room for four!"; sleep 1
        puts "Too late! Go away!".colorize(:red)
      end
    else
      @players.each_with_index { |x, i| puts "#{i + 1} #{x.name.capitalize} \t$#{x.bank_roll}" }
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
      end
      puts "Ok #{@player.name.capitalize} here we go!!!"
    end
    menu
  end

  def menu
    puts "--- Main Menu ---\n".colorize(:blue)
    puts "Choose the game you want to play"
    puts "[1] Highs and Lows"
    puts "[2] Slots"
    puts "[3] Roulette"
    puts "[4] Black Jack"
    puts "[5] Players"
    puts "[6] Bank"
    puts "[7] Exit"
    choice = gets.strip
    case choice
      when '1'
        Highlow.new(player)
      when '2'
        Slots.new(player)
      when '3'
        Roulette.new(player)
      when '4'
        # BlackJack.new(player)
      when '5'
        users
      when '6'
        TooHatedWellsFargo.new(player)
      when '7'
        exit
      else
        puts "Learn how to write"
    end
    menu
  end

end

Casino.new #Calls casino class

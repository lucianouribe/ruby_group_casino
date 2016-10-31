require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'high_low'
require_relative 'slots'

class Casino
  attr_accessor :player

  def initialize
    puts "Welcome to the Ruby Casino!".colorize(:blue)
    @player = Player.new
    menu
  end

  def menu
    puts "Choose the game you want to play"
    # Pass player instance into each game / class that needed access to the player

    puts "[1] Highs and Lows"
    puts "[2] Slots"
    puts "[3] Exit"
    choice = gets.strip
    case choice
      when '1'
        Highlow.new(player)
      when '2'
        Slots.new(player)
      when '3'
        exit
      else
        puts "Learn how to write"
    end
    menu
  end
end

Casino.new #Calls casino class

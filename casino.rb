require 'pry'
require 'colorize'
require_relative 'player'
require_relative 'high_low'

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
    Highlow.new(player)
    puts "[1] Highs and Lows"
    puts "[2] blabla"
    puts "[3] Exit"
  end
end

Casino.new #Calls casino class

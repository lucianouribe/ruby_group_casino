require 'pry'
require 'colorize'

class Casino
  def initialize
    puts "Welcome to the Ruby Casino!".colorize(:blue)
    @player = Player.new
    menu
  end

  def menu
    puts "Choose the game you want to play"
    puts "[1] Highs and Lows"
    puts "[2] blabla"
    puts "[3] Exit"
  end
end

Casino.new #Calls casino class

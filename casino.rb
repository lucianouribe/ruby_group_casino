require 'pry'
require 'colorize'

class Casino
  def initialize
    puts "Welcome to the Ruby Casino!".colorize(:blue)
    @player = Player.new
    menu
  end

  def menu
    #  Figure out how the menu should look
  end
end

Casino.new #Calls casino class

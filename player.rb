class Player
  attr_accessor :name, :bank_roll
  # @player_array = [
  #   {name: player, bank_roll: bank_roll, games_won: number, games_lost: number}
  # ]
  def initialize
      puts "What's your name player?"
      @name = gets.strip
      # TODO: error checking around getting a valid name

      # TODO: figure out as a team what you want to do with bank roll. Random?
      # Ask user? Hard coded value?

      # Do we want bank roll to be a flaot?
      # Player to have a wallet
      # When the player gets created, it gets a new wallet instance (wallet be own class)
      puts "How much money do you have in your wallet?"
      choice = gets.strip.to_i
      @bank_roll = choice
  end

  # def new_player
  #   puts "What's your name player?"
  #   Player.new = gets.strip
  #   puts "How much money do you want to loose?"
  #   choice = gets.strip.to_i
  #   @bank_roll = choice
  # end

end

# array_of_hash << { first_name: 'Marcos'}

module Hangman
  class Board
    attr_accessor :display_board, :turn, :current_guess
    attr_reader :word

    def initialize(word)
      @word = word
      @turn = [" ", " ", " ", " ", " ", " "]
      @current_guess = create_default_guess(word)
    end

    def get_guess(player_guess = gets.chomp)
      index = word.index(player_guess)
      current_guess[index] = player_guess unless !index
    end

    def display_board
      puts " ________ "
      puts "|/       |"
      puts "|        #{turn[0]}"
      puts "|       #{turn[2]}#{turn[1]}#{turn[3]} "
      puts "|       #{turn[4]} #{turn[5]}"
      puts "|"
      puts "|\\"
      puts "-------"
      puts
      puts "#{current_guess.join(" ")}"
      puts
    end

    private

    def create_default_guess(word)
      Array.new(word.length, '_')
    end
  end
end

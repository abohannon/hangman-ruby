module Hangman
  class Board
    attr_accessor :current_guess, :mistakes, :mistake_count
    attr_reader :word

    def initialize(word)
      @word = word
      @current_guess = create_default_guess(word)
      @mistakes = Array.new(6, " ")
      @mistake_count = 0
      #TODO: Add array of guessed letters
    end

    def get_guess(player_guess = gets.chomp)
      index = word.index(player_guess)

      if index
        correct_guess(player_guess, index)
      else
        wrong_guess
      end
    end

    def display_board
      puts " ________ "
      puts "|/       |"
      puts "|        #{mistakes[0]}"
      puts "|       #{mistakes[2]}#{mistakes[1]}#{mistakes[3]} "
      puts "|       #{mistakes[4]} #{mistakes[5]}"
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

    def correct_guess(player_guess, index)
      puts
      puts "Nice guess!"
      puts

      current_guess[index] = player_guess
    end

    def wrong_guess
      puts
      puts "Sorry. Wrong guess."
      puts

      characters = ['O', '|', '-', '-', '/', '\\']
      mistakes[@mistake_count] = characters[@mistake_count]
      @mistake_count += 1
    end
  end
end

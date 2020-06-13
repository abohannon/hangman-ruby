module Hangman
  class Board
    attr_accessor :current_guess, :mistakes
    attr_reader :word

    def initialize(word)
      @word = word
      @current_guess = create_default_guess(word)
      @mistakes = Array.new(6, " ")
      @mistake_count = 0
    end

    def get_guess(player_guess = gets.chomp)
      index = word.index(player_guess)

      if index
        current_guess[index] = player_guess
      else
        wrong_guess
      end

      if @mistake_count == 6
        game_over
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

    def wrong_guess
      characters = ['O', '|', '-', '-', '/', '\\']
      mistakes[@mistake_count] = characters[@mistake_count]
      @mistake_count += 1
    end

    def game_over
      puts
      puts "Bummer! You didn't guess correctly. The word was: #{word}. Better luck next time."
      puts
      return
    end
  end
end

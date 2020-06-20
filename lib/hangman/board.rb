module Hangman
  class Board
    attr_accessor :current_guess, :mistakes, :mistake_count
    attr_reader :word

    def initialize(word)
      @word = word
      @current_guess = create_default_guess(word)
      @mistakes = Array.new(6, " ")
      @mistake_count = 0
      @guessed_letters = []
    end

    def get_guess(player_guess)
      indexes = word.size.times.select { |i| word[i] == player_guess }

      if indexes.empty?
        wrong_guess(player_guess)
      else
        correct_guess(player_guess, indexes)
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
      puts "Guessed: #{@guessed_letters}"
      puts
    end

    private

    def create_default_guess(word)
      Array.new(word.length, '_')
    end

    def correct_guess(player_guess, indexes)
      puts
      puts "Nice guess!"
      puts

      indexes.each { |i| current_guess[i] = player_guess }
    end

    def wrong_guess(player_guess)
      puts
      puts "Sorry. Wrong guess."
      puts

      characters = ['O', '|', '-', '-', '/', '\\']
      mistakes[@mistake_count] = characters[@mistake_count]
      @mistake_count += 1
      @guessed_letters << player_guess
    end
  end
end

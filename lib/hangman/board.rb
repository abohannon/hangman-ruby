module Hangman
  class Board
    attr_accessor :display, :turn, :guess

    def initialize(word)
      @turn = [" ", " ", " ", " ", " ", " "]
      @guess = create_guess_display(word)
    end

    def create_guess_display(word)
      Array.new(word.length, "_").join(" ")
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
      puts "#{guess}"
      puts
    end
  end
end

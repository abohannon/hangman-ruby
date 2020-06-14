module Hangman
  class Game
    attr_reader :word, :board

    def initialize
      @word = get_words_list_and_select_random_word
      @board = Board.new(word)
    end

    def play
      puts
      puts "Welcome to Hangman!"
      puts

      while true do
        board.display_board

        print "Guess a letter: "
        board.get_guess

        if board.mistake_count == 6
          board.display_board
          return lose
        elsif !board.current_guess.include?('_')
          board.display_board
          return win
        end
      end
    end

    private

    def get_words_list_and_select_random_word
      File.read("5desk.txt").split().sample.downcase
    end

    def win
      puts
      puts "Congrats! You guessed the correct word!"
      puts
    end

    def lose
      puts
      puts "Bummer! You didn't guess correctly. The word was: #{word}. Better luck next time."
      puts
    end
  end
end

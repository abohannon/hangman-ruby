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
        return game_over if board.mistake_count == 6
      end
    end

    private

    def get_words_list_and_select_random_word
      File.read("5desk.txt").split().sample.downcase
    end

    def game_over
      puts
      puts "Bummer! You didn't guess correctly. The word was: #{word}. Better luck next time."
      puts
      return
    end
  end
end

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
      puts "To save your game, enter 'save name_of_your_game'"
      puts "To load a saved game, enter 'load name_of_your_game'"
      puts

      while true do
        board.display_board

        print "Guess a letter: "
        player_input = gets.chomp

        load(player_input) if player_input.include?("load")
        save(player_input) if player_input.include?("save")

        board.get_guess(player_input) if player_input.length == 1

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

    def load(input)
      game_name = input.gsub("load ", "")
      filename = "saved/#{game_name}.txt"

      game = Marshal.load(File.open(filename, 'r'))
      @word = game.word
      @board = game.board
    end

    def save(input)
      game_name = input.gsub("save ", "")

      Dir.mkdir("saved") unless Dir.exists?("saved")
      filename = "saved/#{game_name}.txt"

      File.open(filename, 'w') do |file|
        file.write(Marshal.dump(self))
      end
    end

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

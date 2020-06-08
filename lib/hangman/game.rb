module Hangman
  class Game
    attr_reader :word

    def initialize
      @word = File.read("5desk.txt").split().sample
    end
  end
end

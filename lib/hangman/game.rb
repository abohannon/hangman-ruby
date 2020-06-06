module Hangman
  class Game

    attr_reader :words

    def initialize
      @words = File.read("5desk.txt").split()
    end
  end
end

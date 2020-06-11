module Hangman
  class Game
    attr_reader :word

    def initialize
      @word = get_words_list_and_select_random_word
    end

    private

    def get_words_list_and_select_random_word
      File.read("5desk.txt").split().sample.downcase
    end
  end
end

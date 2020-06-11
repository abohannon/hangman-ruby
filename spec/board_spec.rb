require "spec_helper"

module Hangman
  RSpec.describe Board do

    let (:board) { Board.new("hello") }

    context "#initialize" do
      it "initializes a @turn and @guess array " do
        expect(board.turn).to be_a(Array)
        expect(board.turn.length).to eq(6)

      end
    end

    context "#create_guess_display" do
      it "creates a blank guess" do
        expect(board.current_guess).to eq(["_", "_", "_", "_", "_"])
      end
    end

    context "#get_guess" do
      it "compares player guess to word and updates current guess state" do
        board.get_guess('h')
        board.get_guess('e')
        board.get_guess('o')
        expect(board.current_guess).to eq(["h", "e", "_", "_", "o"])
        board.display_board
      end
    end
  end
end

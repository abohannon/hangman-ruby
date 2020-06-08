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
        expect(board.guess).to eq("_ _ _ _ _")
      end
    end
  end
end

require "spec_helper"

module Hangman
  RSpec.describe Board do

    let (:board) { Board.new("hello") }

    context "#initialize" do
      it "initializes a @mistakes array" do
        expect(board.mistakes).to be_a(Array)
        expect(board.mistakes.length).to eq(6)
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
      end

      it "adds characters to the mistakes array when there's a wrong guess" do
        board.get_guess('z')
        board.get_guess('x')

        expect(board.mistakes[0]).to eq('O')
        expect(board.mistakes[1]).to eq('|')
      end

      it "calls game_over if mistake_count is 6" do
        expect(board).to receive(:game_over)

        6.times do
          board.get_guess('x')
        end
      end
    end
  end
end

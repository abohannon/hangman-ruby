require "spec_helper"

module Hangman
  RSpec.describe Game do

    let (:game) { Game.new }

    context "#initialize" do
      it "initializes a random word" do
        expect(game.word).to be_a(String)
      end
    end
  end
end

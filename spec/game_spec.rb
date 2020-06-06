require "spec_helper"

module Hangman
  RSpec.describe Game do

    let (:game) { Game.new }

    context "#initialize" do
      it "initializes a list of words" do
        expect(game.words).to be_a(Array)
        expect(game.words[4]).to eq("aardvark")
      end
    end
  end
end

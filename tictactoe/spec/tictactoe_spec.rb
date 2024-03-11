# frozen_string_literal: true

require_relative "../lib/tictactoe"

describe Game do
  subject(:game) { described_class.new }
  let(:player_x) { double("Player", marker: "X") }
  # let(:player_o) { double("Player", marker: "O") }

  describe "#player_has_won?" do
    let(:board) { game.instance_variable_get(:@board) }

    it "returns true if player has a winning combo" do
      board[1..3] = "X", "X", "X"
      result = game.player_has_won?(player_x)
      expect(result).to be true
    end

    it "returns false if player does NOT have a winning combo" do
      result = game.player_has_won?(player_x)
      expect(result).to be false
    end
  end
end

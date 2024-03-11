# frozen_string_literal: true

require_relative "../lib/tictactoe"

describe Game do
  subject(:game) { described_class.new }
  let(:player_x) { double("Player", marker: "X") }
  # let(:player_o) { double("Player", marker: "O") }
  let(:board) { game.instance_variable_get(:@board) }

  describe "#player_has_won?" do
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

  describe "#free_positions" do
    it "returns array of numbers 1-9 if board is empty" do
      array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(game.free_positions).to eq(array)
    end

    it "returns array of numbers 4-9 if top row of board is populated" do
      board[1..3] = "X", "X", "X"
      array = [4, 5, 6, 7, 8, 9]
      expect(game.free_positions).to eq(array)
    end
  end

  describe "#board_full?" do
    it "returns true if board is full" do
      board[1..9] = "X", "X", "X", "X", "X", "X", "X", "X", "X"
      expect(game.board_full?).to be true
    end

    it "returns false if board is NOT full" do
      board[1..3] = "X", "X", "X"
      expect(game.board_full?).to be false
    end
  end
end

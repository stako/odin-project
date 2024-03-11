class Game
  WINNING_COMBOS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @board = Array.new(10)
    @players = [Player.new(self, "X"), Player.new(self, "O")]
    @current_player_id = @players.index(@players.sample)

    play
  end

  def play
    loop do
      selection = current_player.select_position
      @board[selection] = current_player.marker

      if player_has_won?(current_player)
        print_board
        puts "Player #{current_player.marker} wins!"
        return
      elsif board_full?
        print_board
        puts "It's a draw."
        return
      end

      switch_players!
    end
  end

  def current_player
    @players[@current_player_id]
  end

  def switch_players!
    @current_player_id = 1 - @current_player_id
  end

  def player_has_won?(player)
    WINNING_COMBOS.any? do |combo|
      combo.all? { |pos| @board[pos] == player.marker }
    end
  end

  def free_positions
    (1..9).select { |position| @board[position].nil? }
  end

  def board_full?
    free_positions.empty?
  end

  def print_board
    (1..9).each do |pos|
      if pos == 9
        print "#{@board[pos] || pos}\n"
      elsif (pos % 3).zero?
        print "#{@board[pos] || pos}\n"
        print "--+---+--\n"
      else
        print "#{@board[pos] || pos} | "
      end
    end
  end
end

class Player
  attr_reader :game, :marker

  def initialize(game, marker)
    @game = game
    @marker = marker
  end

  def select_position
    game.print_board

    loop do
      print "Player #{marker} - select your position: "
      selection = gets.to_i
      return selection if game.free_positions.include?(selection)

      puts "Position #{selection} is not available. Try again."
    end
  end
end

Game.new

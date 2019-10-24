class Game
  include Interface

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def play
    until game_finish?
      game_finish? ? break : next_move(@player1)
      game_finish? ? break : next_move(@player2)
    end
    return play_again?
  end

  private

  def game_finish?
    @board.win?(@player1, @board)|| @board.win?(@player2, @board) || @board.full?
  end

end

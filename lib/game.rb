# frozen_string_literal: true

require './lib/interface'

class Game
  include Interface
  attr_accessor :player1, :player2, :board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def play
    show(board.positions)
    loop do
      next_move(player1) ? game_finish? ? break : 'next' : (return false)

      next_move(player2) ? game_finish? ? break : 'next' : (return false)

    end
    get_input('play?') == 'y'
  end

  private

  def game_finish?
    board.full? ? (show_text('full'); true) : check_win?(player1) || check_win?(player2)
  end

  def check_win?(player)
    board.win?(player.inputs) ? (print player.name.to_s; show_text('win'); true) : false
  end

  def next_move(player)
    loop do
      input = get_next_move(player.name)
      case input
      when 'invalid'
        next
      when 'quit'
        return false
      else
        return true if update_input(input, player, board)

        next
      end
    end
  end
end

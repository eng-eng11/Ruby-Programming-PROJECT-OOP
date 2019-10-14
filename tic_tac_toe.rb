class Player
    attr_reader :name, :symbol
    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end
end

class Board
    def initialize
        @current_state = ["", 1, 2, 3, 4, 5, 6, 7, 8, 9]
        @moves = 0
    end

    def show_board
        puts " #{@current_state[1]} | #{@current_state[2]} | #{@current_state[3]} "
        puts "---|---|---"
        puts " #{@current_state[4]} | #{@current_state[5]} | #{@current_state[6]} "
        puts "---|---|---"
        puts " #{@current_state[7]} | #{@current_state[8]} | #{@current_state[9]} "
    end

    def add_move(position, symbol)
        @current_state[position.to_i] = symbol
        @moves += 1
        if winning_move?
            return 1
        elsif draw?
            return -1
        else
            return 0
        end
    end

    def is_move_valid?(position)
        @current_state[position.to_i].is_a? Integer
    end

    private
    def winning_move?
        winning_row? || winning_column? || winning_diagonal?
    end

    def winning_row?
        first_row = [@current_state[1], @current_state[2], @current_state[3]].uniq.length
        second_row = [@current_state[4], @current_state[5], @current_state[6]].uniq.length
        third_row = [@current_state[7], @current_state[8], @current_state[9]].uniq.length
        if [first_row, second_row, third_row].include? 1
            return true
        else
            return false
        end
    end

        def winning_column?
        first_column = [@current_state[1], @current_state[4], @current_state[7]].uniq.length
        second_column = [@current_state[2], @current_state[5], @current_state[8]].uniq.length
        third_column = [@current_state[3], @current_state[6], @current_state[9]].uniq.length
        if [first_column, second_column, third_column].include? 1
            return true
        else
            return false
        end
    end

    def winning_diagonal?
        downward_diag = [@current_state[1], @current_state[5], @current_state[9]].uniq.length
        upward_diag = [@current_state[7], @current_state[5], @current_state[3]].uniq.length
        if [downward_diag, upward_diag].include? 1
            return true
        else
            return false
        end
    end

    def draw?
        @moves == 9
    end
end

class Game
    def initialize
        puts "Player 1, enter your name:"
        @player1 = Player.new(gets.chomp, "X")
        puts "Player 2, enter your name:"
        @player2 = Player.new(gets.chomp, "O")
        @board = Board.new
    end

    def play
        game_over = false
        current_player = @player2
        until game_over
            if current_player == @player2
                current_player = @player1
            else
                current_player = @player2
            end
            valid_move = false
            until valid_move
                puts
                @board.show_board
                puts
                puts "It's #{current_player.name}'s turn."
                puts "What is your move?"
                position = gets.chomp
                valid_move = true if @board.is_move_valid?(position)
            end
            result = @board.add_move(position, current_player.symbol)
            if result == -1
                puts
                @board.show_board
                puts
                puts "It's a draw."
                game_over = true
            elsif result == 1
                puts
                @board.show_board
                puts
                puts "#{current_player.name} wins!"
                game_over = true
            end
        end
    end
end

#game = Game.new
#game.play

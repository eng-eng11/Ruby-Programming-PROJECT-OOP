require "./lib/game"

RSpec.describe Game do
  
  describe "#game_finish?" do
    
    it "return true when board is full" do
      player1 = double("Player")
      player2 = double("Player")
      board = double("Board")
      game = Game.new(player1, player2, board)
      
      allow(board).to receive(:full?){true} 

      expect(game.send(:game_finish?)).to be true

    end
    
    it "return true if any player win" do
      player1 = double("Player")
      player2 = double("Player")
      board = double("Board")
      game = Game.new(player1, player2, board)
      allow(board).to receive(:full?){false} 
      allow(game).to receive(:check_win?){true}

      expect(game.send(:game_finish?)).to be true
    end
  end

  describe "#check_win?" do
      it "return true and print out win if player1 win" do   
        player1 = double('Player')
        player2 = double('Player')
        board = double('Board')
        game = Game.new(player1, player2, board)

        allow(player1).to receive(:inputs) {[1,2,3]}
        allow(player1).to receive(:name) {'player1'} 
        allow(board).to receive(:win?){true}

        expect{game.send(:check_win?,player1)}.to output("player1, congrate! You won!\n").to_stdout

        expect(game.send(:check_win?,player1)).to be true
    end


    it "return false if player2 not win" do   
      player1 = double('Player')
      player2 = double('Player')
      board = double('Board')
      game = Game.new(player1, player2, board)

      allow(player2).to receive(:inputs) {[8,5,4]}
      allow(player2).to receive(:name) {'player2'} 
      allow(board).to receive(:win?){false}

      expect(game.send(:check_win?,player2)).to be false
    end  
  end

  describe "#next_move" do
    it "return false if input return is 'quit' " do
        player1 = double('Player')
        player2 = double('Player')
        board = double('Board')
        game = Game.new(player1, player2, board)

        allow(player1).to receive(:name) {"player1"}

        allow(game).to receive(:get_next_move).and_return('quit')
                
        expect(game.send(:next_move, player1)).to be false
    end

    it "loop until get correct input and return true " do
      player1 = double('Player')
      player2 = double('Player')
      board = double('Board')
      game = Game.new(player1, player2, board)

      allow(player1).to receive(:name) {"player1"}

      allow(game).to receive(:update_input){true}

      allow(game).to receive(:get_next_move).and_return('invalid', 'invalid', '9')

      expect(game.send(:next_move, player1)).to be true
    
    end

  end

end

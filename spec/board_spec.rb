require './lib/board'

RSpec.describe Board do 
  let (:board){Board.new}

  describe "#update" do
    it "update positions with X" do
      board.update(4, 'X')
      expect(board.positions[4-1]).to eql('X')
    end
  end
  
  describe "#full?" do  
    
    it "return true if it is full" do
      
      board.positions =['x', 'z', 'o', 'x', 'x', 'x', 'w', 'e', 'f']
      expect(board.full?).to be true
    end
  end

  describe "#win?" do
    
    it "return true if player win" do
      player1 = double('player')      
      allow(player1).to receive(:inputs) {[2,5,4,8]}     
      expect(board.win?(player1.inputs)).to be true
    end
    
    it "return false if player is not winning" do
      player2 = double('player')
      allow(player2).to receive(:inputs) {[2,5,9]}
      expect(board.win?(player2.inputs)).to be false
    end 
  end
  
  describe "#taken?" do
    
    it "return true if place is taken" do
      board.positions = [1, 2, 3, 4, 5, 'X', 7, 8, 9]
      expect(board.taken?(6)).to be true
    end
    
    it "return false if place isn't taken" do
      board.positions = [1, 2, 3, 4, 5, 'X', 7, 8, 9]
      expect(board.taken?(8)).to be false
    end

  end

end

require "./lib/player"

RSpec.describe Player do  
  describe "#initialize" do
    player = Player.new("kelvin", "X")
    
    it "check name is Kelvin" do
      expect(player.name).to eql('kelvin')
    end
    
    it "check player's inputs is empty" do
      expect(player.inputs).to eql([])
    end
    
    it "check char is X" do
      expect(player.char).to eql('X')
    end
  end

  describe "#move" do
    player = Player.new("Denis", "o")
    it "check if input adding up" do
      expect(player.move(8)).to eql(player.inputs)
    end
  end
end
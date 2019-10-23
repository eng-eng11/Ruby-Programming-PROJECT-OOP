require "./lib/interface"

RSpec.describe Interface do
    include Interface
    describe '#show_text' do
        it "return welcome messages" do 
            expect{show_text('welcome')}.to output("Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game! \n").to_stdout
        end
        it "return board full messages" do 
            expect{show_text('full')}.to output(/Game board is full!/).to_stdout
        end
        it "return finish messages" do 
            expect{show_text('finish')}.to output("Thanks for your time! \n").to_stdout
        end
    end
    
    describe "#valid_number?" do
        it "return false if input is not a valid number" do
            expect(valid_number?('22')).to be false
        end

        it "return true if it is a valid number" do
            expect(valid_number?('1')).to be true
        end
    end 
    
    describe "#get_input" do

        it "show text to ask whether to play again" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('y')
        
        expect{get_input('play?')}.to output("Would you like to play again?(y/n)?\n").to_stdout
        end

        it "return name if required put in name" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('Denis')
        
        expect(get_input('player1')).to eql('Denis') 
        end
    end

    describe "#get_next_move" do    
        it "return 'quit' if input is 'q'" do
        allow_any_instance_of(Kernel).to receive(:gets).and_return('q')

        expect(get_next_move('Player')).to eql('quit')
        end

        it "return 'invalid' if input is not '1 ~ 9'" do 
        allow_any_instance_of(Kernel).to receive(:gets).and_return('12')
        expect(get_next_move('Player')).to eql('invalid')
        end

        it "return '1 ~ 9' if input is '1 ~ 9'" do 
        allow_any_instance_of(Kernel).to receive(:gets).and_return('8')
        
        expect(get_next_move('Player')).to eql('8')
        end
    end

    describe "#update_input" do

        it "return false if not success update" do
            board = double('Board')
            player = double('Player')
            allow(board).to receive(:taken?) {true}
            expect(update_input('2', player, board)).to be false
        end

        it "return true if success update" do
            board = double('Board')
            player = double('Player')
            input = '2'
            allow(board).to receive(:taken?) {false}
            allow(player).to receive(:move) {"2"}
            allow(player).to receive(:char) {"X"}
            allow(board).to receive(:update) {[input, player.char]}

            expect(update_input('2', player, board)).to be true
        end

    end

end
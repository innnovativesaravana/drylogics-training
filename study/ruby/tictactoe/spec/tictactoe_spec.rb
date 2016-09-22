require "byebug"

describe 'TicTacToe' do
  let(:token_invalid) { "INVALID" }
  context 'NxN' do
    let(:p1x1) { Position.new(0, 0) }
    let(:p1x2) { Position.new(0, 1) }
    let(:p1x3) { Position.new(0, 2) }
    let(:p1x4) { Position.new(0, 3) }
    let(:p2x1) { Position.new(1, 0) }
    let(:p2x2) { Position.new(1, 1) }
    let(:p2x3) { Position.new(1, 2) }
    let(:p2x4) { Position.new(1, 3) }
    let(:p3x1) { Position.new(2, 0) }
    let(:p3x2) { Position.new(2, 1) }
    let(:p3x3) { Position.new(2, 2) }
    let(:p3x4) { Position.new(2, 3) }
    let(:p4x1) { Position.new(3, 0) }
    let(:p4x2) { Position.new(3, 1) }
    let(:p4x3) { Position.new(3, 2) }
    let(:p4x4) { Position.new(3, 3) }
    subject(:tictactoe) { TicTacToe.new(4) }
    let(:token_x) { tictactoe.tokens[0] }
    let(:token_0) { tictactoe.tokens[1] }
    

    it 'should be empty to begin with' do
      tictactoe.each_cell { |cell|
        cell.each{|cell|
        expect(cell.empty?).to be_truthy
      }
      }
    end

    it 'should have 16 cells' do
      size = 0
      tictactoe.each_cell { size += 1 }
      expect(size).to eql 4
    end

    it 'should allow placement of symbol' do
      tictactoe.place!(p1x2, token_x)
      expect(tictactoe.token_at(p1x2)).to eq(token_x)
    end

    it 'should not allow placement in marked cells' do
      tictactoe.place!(p1x3, token_x)
      expect { tictactoe.place!(p1x3, token_0) }.to raise_error("Token already placed.")
    end

    it 'should allow only two players' do
      expect{ tictactoe.place!(p1x1,token_invalid)}.to raise_error("Invalid token")
    end

    it 'should alternate between players' do
      tictactoe.place!(p2x2, token_x)
      expect{ tictactoe.place!(p2x3, token_x)}.to raise_error("Your turn is over")
    end

    it 'should declare draw when all cells are filled' do
      game_ended = false
      tictactoe.register_listener(:draw) {|last_played|
        # expect(last_played).to be(token_x)
        game_ended = true
      }
      tictactoe.place!(p1x1, token_x)
      tictactoe.place!(p1x2, token_0)
      tictactoe.place!(p1x3, token_x)
      tictactoe.place!(p1x4, token_0)
      tictactoe.place!(p2x4, token_x) 
      tictactoe.place!(p2x3, token_0)
      tictactoe.place!(p2x2, token_x)
      tictactoe.place!(p2x1, token_0)
      tictactoe.place!(p3x4, token_x)
      tictactoe.place!(p3x3, token_0)
      tictactoe.place!(p3x2, token_x)
      tictactoe.place!(p3x1, token_0)
      tictactoe.place!(p4x1, token_x)
      tictactoe.place!(p4x2, token_0)
      tictactoe.place!(p4x3, token_x)
      tictactoe.place!(p4x4, token_0)
      expect(game_ended).to be_truthy
    end

    context "Win Condition" do
      it 'should be when same token occupies a row_left'  do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p2x1, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p2x2, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p2x3, token_x)
        expect(game_ended).to be_truthy
      end

      it 'should be when same token occupies a row_right'  do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p2x3, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p2x2, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p2x1, token_x)
        expect(game_ended).to be_truthy
      end

      it 'should be when same token occupies a column_down' do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p3x1, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p2x1, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p1x1, token_x)

        expect(game_ended).to be_truthy
      end

      it 'should be when same token occupies a column_up' do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p1x1, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p2x1, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p3x1, token_x)
        expect(game_ended).to be_truthy
      end

      it 'should be when same token occupies a diagonal left_up' do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p3x3, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p2x2, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p1x1, token_x)
        expect(game_ended).to be_truthy
      end

      it 'should be when same token occupies a diagonal right_down' do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p3x3, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p2x2, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p1x1, token_x)
        expect(game_ended).to be_truthy
      end

      it 'should be when same token occupies a diagonal right_up' do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p1x4, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p2x3, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p3x2, token_x)
        expect(game_ended).to be_truthy
      end

      it 'should be when same token occupies a diagonal left_down' do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p3x2, token_x)
        tictactoe.place!(p1x3, token_0)
        tictactoe.place!(p2x3, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p1x4, token_x)
        expect(game_ended).to be_truthy
      end

      it 'should declare winner even though all fields are filled and there is a winner' do
        game_ended = false
        tictactoe.register_listener(:win) { |winner|
          # expect(winner).to be(token_x)
          game_ended = true
        }
        tictactoe.place!(p1x1, token_x)
        tictactoe.place!(p1x2, token_0)
        tictactoe.place!(p2x1, token_x)
        tictactoe.place!(p3x1, token_0)
        tictactoe.place!(p2x2, token_x)
        tictactoe.place!(p2x3, token_0)
        tictactoe.place!(p3x2, token_x)
        tictactoe.place!(p4x3, token_0)
        tictactoe.place!(p1x3, token_x)
        tictactoe.place!(p3x4, token_0)
        tictactoe.place!(p2x4, token_x)
        tictactoe.place!(p1x4, token_0)
        tictactoe.place!(p4x1, token_x)
        tictactoe.place!(p4x2, token_0)
        tictactoe.place!(p4x4, token_x)
        tictactoe.place!(p3x3, token_0)
        expect(game_ended).to be_truthy
      end
    end
  end
    
end
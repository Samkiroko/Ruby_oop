require 'rspec'
require_relative '../lib/interface.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

RSpec.describe Interface do
  include Interface
  describe '#get_input' do
    it 'return welcome messages' do
      expect { get_input('welcome') }.to output("Welcome to the Tic-Tac-Toe Game, there will be 2 players to join this game! \n").to_stdout
    end
    it 'return board full messages' do
      expect { get_input('draw') }.to output("Game board is full! Its a draw!\n").to_stdout
    end
    it 'return finish messages' do
      expect { get_input('finish') }.to output("Thanks for your time! \n").to_stdout
    end
  end

  describe '#valid_number?' do
    it 'return false if input is not a valid number' do
      expect(valid_number?('22')).to be false
    end

    it 'return true if it is a valid number' do
      expect(valid_number?('1')).to be true
    end
  end

  describe '#next_move' do
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
end

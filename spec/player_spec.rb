require 'rspec'
require_relative '../lib/interface.rb'
require_relative '../lib/board.rb'
require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

RSpec.describe Player do
  context '#initialize' do
    player = Player.new('sam', 'X')
    it 'check name is sam' do
      allow(player).to receive(:name) { 'sam' }
      expect(player.name).to eql('sam')
    end

    it "check player's inputs is empty" do
      expect(player.inputs).to eql([])
    end

    it 'check char is X' do
      expect(player.char).to eql('X')
    end
  end

  describe '#move' do
    player = Player.new('Denis', 'o')
    it 'check if input adding up' do
      expect(player.move(8)).to eql(player.inputs)
    end
  end
end

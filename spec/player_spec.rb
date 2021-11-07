require "player"

describe Player do
  let(:named_player) { described_class.new("Red") }
  let(:unnamed_player) { described_class.new("") }

  it 'names the player whatever name is passed into initializing arguments' do
    expect(named_player.name).to eq "Red"
  end

  it 'assigns a default computer name if "" is passed as the name' do
    expect(unnamed_player.name).to eq Player::COMPUTER_NAME
  end

  describe '#computer?' do
    it 'returns true if the player is the computer, returns false if a person' do
      expect(unnamed_player.computer?).to eq true
      expect(named_player.computer?).to eq false
    end
  end

  describe '#receive_implement' do
    it 'sets the value of @implement to whatever is passed in' do
      unnamed_player.receive_implement(:rock)
      expect(unnamed_player.implement).to eq :rock
    end
  end

  describe '#remove_implement' do
    it 'removes the current implement from the player' do
      named_player.receive_implement(:rock)
      named_player.remove_implement
      expect(named_player.implement).to eq nil
    end
  end
end

require_relative './battleship'

describe Battleship do
  let(:carrier) do
    {
      type: :carrier,
      position: 'A6',
      direction: :south,
      length: 5
    }
  end

  let(:battleship) do
    {
      type: :battleship,
      position: 'D9',
      direction: :south,
      length: 4
    }
  end

  let(:submarine) do
    {
      type: :submarine,
      position: 'I7',
      direction: :north,
      length: 3
    }
  end

  let(:banana) do
    {
      type: :banana,
      position: 'B4',
      direction: :east,
      length: 2
    }
  end

  ### for testing west placement of ships
  let(:banaynay) do
    {
      type: :banaynay,
      position: 'F2',
      direction: :west,
      length: 2
    }
  end

  let(:game) { Battleship.new([carrier, battleship, submarine, banana, banaynay]) }

  subject { game }

  context 'hits' do
    it 'the beginning edge of the Submarine' do
      turn = subject.fire!('I7') # Hits the Submarine
      puts turn
      expect(turn).to be true
    end

    it 'the middle of the Battleship' do
      turn = subject.fire!('G9') # Hits the Battleship

      expect(turn).to be true
    end

    it 'the ending edge of the Carrier' do
      turn = subject.fire!('E6') # Hits the Carrier

      expect(turn).to be true
    end

    it 'the ending edge of the Banana' do
      turn = subject.fire!('B5') # Hits the Banana

      expect(turn).to be true
    end

    ## testing the west placement
    it 'the banaynay' do
        turn = subject.fire!('F2') #hits the banaynay

        expect(turn).to be true
    end

    it 'returns type of ship when sunk' do
      pending 'bonus points'

      turn = subject.fire!('B4')
      expect(turn).to be true

      turn = subject.fire!('B5')
      expect(turn).to be :banana
    end
  end

  context 'misses' do
    it 'and hits the middle of the ocean' do
      turn = subject.fire!('E3')

      expect(turn).to be_falsy
    end
  end
end

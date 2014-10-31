###############################################################################
##
## Tests for the rover class
##
###############################################################################

require 'rover'
require 'plateau'

describe MarsRover::Rover do
  
  before :each do
    # lets create a dummy plateau object
    @plateau = MarsRover::Plateau.new(0, 0, 5, 5)
  end

  describe '#new' do
    it 'ensures that we have an object of the Rover class' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'N')
      expect(rover).to be_an_instance_of(MarsRover::Rover)
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'e')
      expect(rover).to be_an_instance_of(MarsRover::Rover)
    end

    it 'ensures that we throw an error if an invalid position is specified' do
      expect {MarsRover::Rover.new(@plateau, -1, -2, 'N')}.to raise_error
      expect {MarsRover::Rover.new(@plateau, 0, 0, 'X')}.to raise_error
    end
  end

  describe '#get_orientation' do
    it 'checks if the current orientation is returned correctly' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'N')
      expect(rover.get_orientation).to eq('N')

      rover = MarsRover::Rover.new(@plateau, 0, 0, 'S')
      expect(rover.get_orientation).to eq('S')

      rover = MarsRover::Rover.new(@plateau, 0, 0, 'W')
      expect(rover.get_orientation).to eq('W')

      rover = MarsRover::Rover.new(@plateau, 0, 0, 'E')
      expect(rover.get_orientation).to eq('E')
    end
  end

  describe '#get_current_position' do
    it 'checks if the current position is returned correctly' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'N')
      expect(rover.get_current_position).to eq([0, 0])

      rover = MarsRover::Rover.new(@plateau, 3, 5, 'N')
      expect(rover.get_current_position).to eq([3, 5])
    end
  end

  describe '#turn_left' do
    it 'checks if the rover turns correctly' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'N')
      rover.turn_left
      expect(rover.get_orientation).to eq('W')

      rover.turn_left
      expect(rover.get_orientation).to eq('S')

      rover.turn_left
      expect(rover.get_orientation).to eq('E')

      rover.turn_left
      expect(rover.get_orientation).to eq('N')
    end
  end

  describe '#turn_right' do
    it 'checks if the rover turns correctly' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'N')
      rover.turn_right
      expect(rover.get_orientation).to eq('E')

      rover.turn_right
      expect(rover.get_orientation).to eq('S')

      rover.turn_right
      expect(rover.get_orientation).to eq('W')

      rover.turn_right
      expect(rover.get_orientation).to eq('N')
    end
  end

  describe '#move' do
    it 'checks if the rover has moved north' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'N')
      rover.move
      expect(rover.get_orientation).to eq('N') 
      expect(rover.get_current_position).to eq([0, 1])
    end

    it 'checks if the rover has moved south' do
      rover = MarsRover::Rover.new(@plateau, 2, 3, 'S')
      rover.move
      expect(rover.get_orientation).to eq('S') 
      expect(rover.get_current_position).to eq([2, 2])
    end 

    it 'checks if the rover can move east' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'E')
      rover.move
      expect(rover.get_orientation).to eq('E') 
      expect(rover.get_current_position).to eq([1, 0])
    end

    it 'checks if the rover can move west' do
      rover = MarsRover::Rover.new(@plateau, 2, 2, 'W')
      rover.move
      expect(rover.get_orientation).to eq('W') 
      expect(rover.get_current_position).to eq([1, 2])
    end

    it 'checks if the rover throws an exception on invalid move' do
      rover = MarsRover::Rover.new(@plateau, 0, 0, 'W')
      expect {rover.move}.to raise_error

      rover = MarsRover::Rover.new(@plateau, 0, 0, 'S')
      expect {rover.move}.to raise_error

      rover = MarsRover::Rover.new(@plateau, 5, 5, 'N')
      expect {rover.move}.to raise_error

      rover = MarsRover::Rover.new(@plateau, 5, 5, 'E')
      expect {rover.move}.to raise_error
    end
  end


end

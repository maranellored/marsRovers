###############################################################################
##
## Tests for the Plateau class
##
###############################################################################

require 'spec_helper'
require 'plateau'

describe MarsRover::Plateau do
  describe '#new' do
    it 'ensures that we have an object of the plateau class' do
      plateau = MarsRover::Plateau.new(0, 0, 5, 5)
      expect(plateau).to be_an_instance_of(MarsRover::Plateau)
    end

    it 'ensures that an invalid plateau declaration throws an error' do
      expect {MarsRover::Plateau.new(1, 1, 0, 0)}.to raise_error
    end
  end

  describe '#validate_position' do
    it 'shows that the point is in the plateau' do
      plateau = MarsRover::Plateau.new(0, 0, 5, 5)
      expect(plateau.validate_position(3, 3)).to be
      expect(plateau.validate_position(4, 1)).to be
      expect(plateau.validate_position(0, 0)).to be
      expect(plateau.validate_position(5, 5)).to be
    end

    it 'detects invalid positions' do
      plateau = MarsRover::Plateau.new(0, 0, 5, 5)
      expect(plateau.validate_position(6, 1)).not_to be
      expect(plateau.validate_position(5, 6)).not_to be
      expect(plateau.validate_position(-1, 4)).not_to be
      expect(plateau.validate_position(0, -5)).not_to be
    end
  end

end

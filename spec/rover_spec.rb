###############################################################################
##
## Tests for the rover class
##
###############################################################################

require 'rover'
require 'plateau'

describe MarsRover::Rover do
  
  before :each do
    @plateau = double('plateau', :validate_rover_position => true)
    @rover = MarsRover::Rover.new(@plateau, 0, 0, 'N')
  end

  describe '#new' do
    before :each do
      @broken_rover = MarsRover::Rover.new(@plateau, -1, -5, 'N')
    end

    it 'ensures that we have an object of the Rover class' do
      expect(@rover).to be_an_instance_of(MarsRover::Rover)
    end

    it 'ensures that we have a broken rover' do
      expect {@broken_rover}.to raise_error
    end
  end

end

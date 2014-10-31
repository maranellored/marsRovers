###############################################################################
##
## Tests for the rover controller class
##
###############################################################################

require 'spec_helper'
require 'rover_controller'
require 'rover'

describe MarsRover::RoverController do
  
  describe '.parse_coordinates_from_string' do
    it 'tests if we can retrieve the right co-ordinates from a string' do
      expect(MarsRover::RoverController.parse_coordinates_from_string("2 2 N")).to eq([2, 2])
      expect(MarsRover::RoverController.parse_coordinates_from_string("2 2 XXX")).to eq([2, 2])
      expect(MarsRover::RoverController.parse_coordinates_from_string("23 43 XXX")).to eq([23, 43])
      expect(MarsRover::RoverController.parse_coordinates_from_string("23 43 123 32")).to eq([23, 43])
    end

    it 'tests if invalid string throws an error' do
      expect {MarsRover::RoverController.parse_coordinates_from_string("2343 XXX")}.to raise_error
      expect {MarsRover::RoverController.parse_coordinates_from_string("4 XXX")}.to raise_error
      expect {MarsRover::RoverController.parse_coordinates_from_string("x y XXX")}.to raise_error
    end
  end

  describe '.parse_orientation_from_string' do
    it 'tests if we can retrieve the orientation from a string' do 
      expect(MarsRover::RoverController.parse_orientation_from_string("1 2 N")).to eq('N')
      expect(MarsRover::RoverController.parse_orientation_from_string("11 22 W")).to eq('W')
    end
  end
  
end

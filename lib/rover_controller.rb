###############################################################################
##
##  A RoverController class. 
##  Helps parse the input and control the rovers
##
###############################################################################

require 'plateau'
require 'rover'

module MarsRover

  class RoverController

    PLATEAU_BOTTOM_X = 0
    PLATEAU_BOTTOM_Y = 0

    def self.control(logger, input_list) 

      raise ArgumentError, "No input given!" if input_list.empty?

      # the first element in the list is the co-ordinates 
      # of the top left corner of the plateau
      plateau_max_x, plateau_max_y = parse_coordinates_from_string(input_list.shift)
      # hard code the bottom left corner to 0, 0
      plateau = Plateau.new(PLATEAU_BOTTOM_X, PLATEAU_BOTTOM_Y, plateau_max_x, plateau_max_y)

      # The remaining items in the input list are the rover positions and their
      # controlling commands. 
      #
      # Grab 2 items at a time. 
      # Assume first item is the rover position and the second is the
      # control command list. 
      input_list.each_slice(2) do |start_position, control_commands| 

        if start_position.nil? or control_commands.nil?
          raise ArgumentError, "Insufficient arguments to control the rover"
        end

        rover_x, rover_y = parse_coordinates_from_string(start_position)
        rover_orientation = parse_orientation_from_string(start_position)
        # make a new rover for this plateau
        rover = Rover.new(plateau, rover_x, rover_y, rover_orientation)

        begin 
          control_commands.each_char do |c|
            case c.upcase
            when 'L'
              logger.debug("Turning left from #{rover.get_orientation}")
              rover.turn_left
            when 'M'
              logger.debug("Moving 1 step #{rover.get_orientation} from #{rover.get_current_position}")
              rover.move
            when 'R'
              logger.debug("Turning right from #{rover.get_orientation}")
              rover.turn_right
            else 
              puts "invalid code"
            end
          end
        rescue RuntimeError => e
          logger.error "Rover is off the plateau. Moving to next rover. Error msg: #{e.message}"
          next
        end

        print_rover_position(logger, rover)
      end

    end

    def self.print_rover_position(logger, rover)
      x_pos, y_pos = rover.get_current_position
      logger.info("#{x_pos} #{y_pos} " + rover.get_orientation)
    end

    # Helper method to help retrieve the co-ordinates from a string.
    # It assumes that the co-ordinates are a space separated tuple of integers
    # Throws an exception if non integer values are specified
    def self.parse_coordinates_from_string(string) 
      coords = string.split
      raise ArgumentError, "Invalid coordinate input for the mars plateau" unless coords.length > 1

      # convert to integer and return the x and y co-ordinates
      return [Integer(coords[0]), Integer(coords[1])]
    end

    # The orientation is the 3rd word in a string
    # Eg. 5 1 N or 0 0 E etc. 
    #
    # Doesn't perform any kind of error checking. The higher level
    # class that uses this orientation is expected to handle any malformed 
    # inputs
    def self.parse_orientation_from_string(string)
      return string.split[2]
    end

  end # class end

end # module end

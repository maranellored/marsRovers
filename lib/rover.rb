###############################################################################
##
##  A MarsRover class. 
##  Helps move the rover around 
##
##  The square north of x, y is x, y+1
##  The square south of x, y is x, y-1
##  The square east of x, y is x+1, y
##  The square west of x, y is x-1, y
##
##  The constructor to this class makes use of the MarsRover::Plateau class
##  which is used to validate the position of the rover, relative to the
##  plateau which it is exploring
###############################################################################

module MarsRover

  class Rover
    NORTH = 'N'
    SOUTH = 'S'
    WEST = 'W'
    EAST = 'E'

    def initialize(plateau, start_x_pos, start_y_pos, orientation) 
      @plateau = plateau

      @current_X_pos = start_x_pos
      @current_Y_pos = start_y_pos

      unless (orientation.upcase == NORTH || orientation.upcase == SOUTH || orientation.upcase == WEST || orientation.upcase == EAST)
        raise ArgumentError, 'orientation is not valid'
      end
      @current_orientation = orientation.upcase

      raise ArgumentError, "Invalid position specified" unless @plateau.validate_position(*get_current_position)
    end

    # Basic move method. 
    # The move is determined based on the current orientation. 
    # The distance to move defaults to 1 but can be passed in by the user
    # Calls the internal helper methods to move the rover based on orientation
    def move(distance=1)
      case @current_orientation
      when NORTH
        move_north(distance)
        raise RuntimeError, "Invalid move! Off the grid" unless @plateau.validate_position(*get_current_position)
      when SOUTH
        move_south(distance)
        raise RuntimeError, "Invalid move! Off the grid" unless @plateau.validate_position(*get_current_position)
      when EAST
        move_east(distance)
        raise RuntimeError, "Invalid move! Off the grid" unless @plateau.validate_position(*get_current_position)
      when WEST
        move_west(distance)
        raise RuntimeError, "Invalid move! Off the grid" unless @plateau.validate_position(*get_current_position)
      else
        raise RuntimeError, 'Current Orientation is invalid'
      end
    end

    # Turns the rover to the left, based on the current
    # orientation
    def turn_left
      case @current_orientation
      when NORTH
        @current_orientation = WEST
      when SOUTH
        @current_orientation = EAST
      when EAST
        @current_orientation = NORTH
      when WEST
        @current_orientation = SOUTH
      else
        raise RuntimeError, 'Current Orientation is invalid'
      end
    end

    # Turns the rover to the right, based on the current
    # orientation.
    def turn_right
      case @current_orientation
      when NORTH
        @current_orientation = EAST
      when SOUTH
        @current_orientation = WEST
      when EAST
        @current_orientation = SOUTH
      when WEST
        @current_orientation = NORTH
      else
        raise RuntimeError, 'Current Orientation is invalid'
      end
    end

    # get current orientation
    def get_orientation
      @current_orientation
    end

    # get the current position
    def get_current_position
      [@current_X_pos, @current_Y_pos]
    end

    # These methods are private methods that are used
    # internally by the rover class. 
    # These are not exposed externally.
    # Do not add any new external methods after this line
    private
    def move_north(distance)
      @current_Y_pos += distance
    end
  
    def move_south(distance)
      @current_Y_pos -= distance
    end
  
    def move_east(distance)
      @current_X_pos += distance
    end

    def move_west(distance)
      @current_X_pos -= distance
    end

  end # class rover end

end # module marsRover end

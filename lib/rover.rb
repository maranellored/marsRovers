###############################################################################
##
##  A MarsRover class. 
##  Helps move the rover around 
##
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

      unless (orientation == NORTH || orientation == SOUTH || orientation == WEST || orientation == EAST)
        raise ArgumentError, 'orientation is not valid'
      end
      @current_orientation = orientation

      raise ArgumentError, "Invalid position specified" unless @plateau.validate_position(*get_current_position)
    end

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

  end # class rover end

end # module marsRover end

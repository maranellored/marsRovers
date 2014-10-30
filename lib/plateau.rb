###############################################################################
##
##  A class to represent the mars Plateau 
##  Helps keep the plateau in check and can validate positions
##
###############################################################################

module MarsRover

  class Plateau

    def initialize(lower_x, lower_y, upper_x, upper_y)
      @bottom_left_X_pos = lower_x
      @bottom_left_Y_pos = lower_y
      @top_right_X_pos = upper_x
      @top_right_Y_pos = upper_y
    end

    # validates the position of the rover w.r.t the current plateau
    def validate_position(current_x_pos, current_y_pos)
      
      if ((@bottom_left_X_pos <= current_x_pos) && (current_x_pos <= @top_right_X_pos)) &&
          ((@bottom_left_Y_pos <= current_y_pos) && (current_y_pos <= @top_right_Y_pos))
        return true
      end

      return false
    end

  end # class plateau

end # module marsRover

#!/usr/bin/env ruby

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'optparse'
require 'plateau'
require 'rover'

def run()
  options = {}
  opt_parser = OptionParser.new do |opts|


  end

  opt_parser.parse!

  input_list = []
  loop do 
    input = gets.strip
    break if input.empty?
    input_list << input
  end

  # the first element in the list is the co-ordinates 
  # of the top left corner of the plateau
  plateau_max_x, plateau_max_y = parse_coordinates_from_string(input_list.shift)
  # hard code the bottom left corner to 0, 0
  plateau = MarsRover::Plateau.new(0, 0, plateau_max_x, plateau_max_y)

  input_list.each_slice(2) do |start_position, control_commands| 

    if start_position.nil? or control_commands.nil?
      raise ArgumentError, "Invalid argument specified"
    end

    rover_x, rover_y, rover_orientation = start_position.split
    rover = MarsRover::Rover.new(plateau, rover_x.to_i, rover_y.to_i, rover_orientation)

    control_commands.each_byte do |c|
      case c.chr
      when 'L'
        rover.turn_left
      when 'M'
        rover.move
      when 'R'
        rover.turn_right
      else 
        puts "invalid code"
      end
    end

    print_rover_position rover
  end
end

def print_rover_position(rover)
  x_pos, y_pos = rover.get_current_position
  puts "#{x_pos} #{y_pos} " + rover.get_orientation
end

def parse_coordinates_from_string(string) 
  coords = string.split
  raise ArgumentError, "Invalid coordinates for the mars plateau" unless coords.length > 1

  # convert to integer and return the x and y co-ordinates
  return [coords[0].to_i, coords[1].to_i]
end

if __FILE__ == $0
  run()
end

Mars Rovers
===========

A mars rover controller! 

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. 
This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth. 

A rover's position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. 
The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North. 

In order to control a rover, NASA sends a simple string of letters. 
The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading. 

Assumes that the square directly North from (x, y) is (x, y+1). 

**NOTE:**
This assumes that once you move a rover off the grid, the rover stops and doesnt move back. We stop processing the rover at that time. 

Usage
-----
Pre-requisites: 

Needs [bundler](http://bundler.io) to setup the ruby dependencies (rspec and simplecov). Run the following
```
$ gem install bundler
$ git clone https://github.com/maranellored/marsRovers.git 
$ cd marsRover
$ bundle install
```

To use with bundler, run the following.
```
$ bundle exec bin/marsRover
```
To view the usage for the program, run
```
$ bundle exec bin/marsRover -h
```
Input is formatted as follows
- First line is the co-ordinates of the upper-right corner of the plateau
- Second line is the start co-ordinates of a rover with the direction it is facing
- Third line is the list of moves for a rover
- Repeat the second and third lines multiple times for multiple rovers
- Input a blank line after all the rovers are input

Example input:
```
$ bundle exec bin/marsRover
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
```
To run the rspec tests, run the following
```
$ bundle exec rake
```

**NOTE:** This has been tested with ruby 2.1.1 and 2.0.0

Should work with ruby version > 1.9. Just run with your preferred ruby version as follows
```
ruby bin/marsRover
```

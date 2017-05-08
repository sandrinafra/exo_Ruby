#!/usr/bin/ruby -w

def sort_file
  puts open('numbers.txt', 'r').read.split(',').map(&:to_i).sort
end

sort_file if $PROGRAM_NAME == __FILE__

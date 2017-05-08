#!/usr/bin/ruby -w

def my_var
  a = 10
  b = '10'
  c = 'dix'
  d = 10.0
  puts 'mes variables :'
  puts "\ta contient : #{a} et est de type: #{a.class}"
  puts "\tb contient : #{b} et est de type: #{b.class}"
  puts "\tc contient : #{c} et est de type: #{c.class}"
  puts "\td contient : #{d} et est de type: #{d.class}"
end

my_var if $PROGRAM_NAME == __FILE__

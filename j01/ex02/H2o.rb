#!/usr/bin/ruby -w

def tab
  data = [['Caleb', 24], ['Calixte', 84], ['Calliste', 65], ['Calvin', 12],
          ['Cameron', 54], ['Camil', 32], ['Camille', 5], ['Can', 52],
          ['Caner', 56], ['Cantin', 4], ['Carl', 1], ['Carlito', 23],
          ['Carlo', 19], ['Carlos', 26], ['Carter', 54], ['Casey', 2]]

  new_data = {}
  data.each { |d| new_data[d[0]] = d[1] }
  new_data.each { |k, v| puts "#{k} : #{v}" }
end

tab if $PROGRAM_NAME == __FILE__

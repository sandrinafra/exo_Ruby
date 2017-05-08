#!/usr/bin/ruby -w

def croissant
  data = [['Frank', 33], ['Stacy', 15], ['Juan', 24], ['Dom', 32],
          ['Steve', 24], ['Jill', 24]]

  data = data.sort_by { |_k, v| v }
  doubles = {}
  data.each { |k, v| doubles[v].nil? ? doubles[v] = [k] : doubles[v] << k }

  doubles.each { |_k, v| puts v.sort }
end

croissant if $PROGRAM_NAME == __FILE__

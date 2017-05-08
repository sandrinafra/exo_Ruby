#!/usr/bin/ruby -w

def research
  states = { 'Oregon' => 'OR', 'Alabama' => 'AL', 'New Jersey' => 'NJ',
             'Colorado' => 'CO' }
  capitals_cities = { 'OR' => 'Salem', 'AL' => 'Montgomery', 'NJ' => 'Trenton',
                      'CO' => 'Denver' }

  return unless ARGV.count == 1
  if capitals_cities[states[ARGV.first]].nil?
    puts 'Unknow state'
  else
    puts capitals_cities[states[ARGV.first]]
  end
end

research if $PROGRAM_NAME == __FILE__

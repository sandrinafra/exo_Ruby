#!/usr/bin/ruby -w

def research
  states = { 'Oregon' => 'OR', 'Alabama' => 'AL', 'New Jersey' => 'NJ',
             'Colorado' => 'CO' }
  capitals_cities = { 'OR' => 'Salem', 'AL' => 'Montgomery', 'NJ' => 'Trenton',
                      'CO' => 'Denver' }

  return unless ARGV.count == 1
  args = ARGV[0].split(',').map(&:strip)
  args.each do |arg|
    arg = arg.split.map(&:capitalize).join(' ')
    verif(arg, states, capitals_cities)
  end
end

def verif(arg, states, capitals_cities)
  if states[arg]
    print capitals_cities[states[arg]].to_s
    puts "is the capital of #{arg} (akr: #{states[arg]})"
  elsif capitals_cities.key(arg)
    print "#{arg} is the capital of #{states.key(capitals_cities.key(arg))}"
    puts "(akr: #{capitals_cities.key(arg)})"
  elsif !arg.empty?
    puts "#{arg} is neither a capital city nor a state"
  end
end

research if $PROGRAM_NAME == __FILE__

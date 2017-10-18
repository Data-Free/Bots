# google maps direction bot for https://github.com/Data-Free
require 'google_maps_service'
require 'sanitize'
require 'yaml'

# make sure it is a valid request
if ARGV.length != 2
  puts "Please place destination A and B in single quotes\n ex. 'address 1' 'address 2'"
  exit
end


config = YAML.load_file("config.yml")

# no maps_key, don't run
if !config[:google][:maps_key]
  exit
end

gmaps = GoogleMapsService::Client.new(key: config[:google][:maps_key])


routes = gmaps.directions(ARGV[0], ARGV[1], mode: 'driving', alternatives: false)

# handle meta information
puts 'Your destination is ' + routes[0][:legs][0][:distance][:text] + ' away (' + routes[0][:legs][0][:duration][:text] + ' by car)'

# print out simple individual steps
routes[0][:legs][0][:steps].each { |step|
  puts Sanitize.clean(step[:html_instructions]) + ' (' + step[:distance][:text] + ')'
}

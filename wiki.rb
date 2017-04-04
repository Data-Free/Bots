require 'wikipedia'

input = ARGV.join(" ")

page = Wikipedia.find(input)
content = page.summary
puts(content)


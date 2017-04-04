require 'urban_dictionary'

input = ARGV.join(" ")
content = UrbanDictionary.define(input)

answer = ""
content.entries.each do |entry|
  answer = answer + entry.definition
  answer = answer + entry.example
end

puts(answer)


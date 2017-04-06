input = ARGV.join(" ")

open('suggestions.txt', 'a') { |f|
  f.puts "-"
  f.puts input
}

puts("Thank you for your suggestion!")

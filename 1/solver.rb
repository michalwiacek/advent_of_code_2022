#!/usr/bin/env ruby

file_path = File.expand_path("../input", __FILE__)
input     = File.read(file_path)

rows = input.split("\n").map(&:to_i)

h = Hash.new(0)
i = 0
rows.each_with_object(h) do |x, hash|
  i += 1 if x == 0
  hash[i] += x
end
p h.max_by{|k,v| v}

#!/usr/bin/env ruby

file_path = File.expand_path("../input", __FILE__)
input     = File.read(file_path)

rows = input.split("\n")

second_choice = {
  "X" => 1,
  "Y" => 2,
  "Z" => 3
}
score_points = {
  'draw' => 3,
  'win' => 6,
  'loss' => 0
}

array = []

def fight(row)
  case row[0]
  when 'A'
    return 'draw' if row[2] == 'X'
    return 'win' if row[2] == 'Y'
    return 'loss' if row[2] == 'Z'
  when 'B'
    return 'loss' if row[2] == 'X'
    return 'draw' if row[2] == 'Y'
    return 'win' if row[2] == 'Z'
  when 'C'
    return 'win' if row[2] == 'X'
    return 'loss' if row[2] == 'Y'
    return 'draw' if row[2] == 'Z'
  end
end
rows.each_with_object(array) do |row, array|
  score = fight(row)
  array << second_choice[row[2]] + score_points[score]
end

p array.sum

# rock A, paper B, scissors C
# rock X, paper Y, scissors Z
# 1, 2, 3

#loss 0, draw 3, win 6

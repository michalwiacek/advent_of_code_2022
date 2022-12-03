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
  'Y' => 3,
  'Z' => 6,
  'X' => 0
}
# x loss, y draw, z win
array = []

def fight(row)
  case row[0]
  when 'A'
    return 'Z' if row[2] == 'X' # loss
    return 'X' if row[2] == 'Y' # draw
    return 'Y' if row[2] == 'Z' # win
  when 'B'
    return 'X' if row[2] == 'X'
    return 'Y' if row[2] == 'Y'
    return 'Z' if row[2] == 'Z'
  when 'C'
    return 'Y' if row[2] == 'X'
    return 'Z' if row[2] == 'Y'
    return 'X' if row[2] == 'Z'
  end
end
rows.each_with_object(array) do |row, array|
  score = fight(row)
  array << second_choice[score] + score_points[row[2]]
end

p array.sum

# rock A, paper B, scissors C
# rock X, paper Y, scissors Z
# 1, 2, 3

#loss 0, draw 3, win 6

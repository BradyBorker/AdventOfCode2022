tree_input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

tree_rows = []
tree_input.each do |tree_row|
  tree_rows.append(tree_row.chars)
end

for tree_row in tree_rows
  for tree_index in 0...tree_row.length
    p tree_row[tree_index]
  end
end
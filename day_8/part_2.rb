def check_up(tree_input, tree_row_index, tree_column_index)
  row_index = tree_row_index
  vision_score = 0
  while row_index > 0
    row_index -= 1
    vision_score += 1
    if tree_input[tree_row_index][tree_column_index] <= tree_input[row_index][tree_column_index]
      return vision_score  
    end
  end
  vision_score
end

def check_down(tree_input, tree_row_index, tree_column_index)
  row_index = tree_row_index
  vision_score = 0
  while row_index < tree_input[0].length-1
    row_index += 1
    vision_score += 1
    if tree_input[tree_row_index][tree_column_index] <= tree_input[row_index][tree_column_index]
      return vision_score 
    end
  end
  vision_score
end

def check_left(tree_input, tree_row_index, tree_column_index)
  column_index = tree_column_index
  vision_score = 0
  while column_index > 0
    column_index -= 1
    vision_score += 1
    if tree_input[tree_row_index][tree_column_index] <= tree_input[tree_row_index][column_index]
      return vision_score 
    end
  end
  vision_score
end

def check_right(tree_input, tree_row_index, tree_column_index)
  column_index = tree_column_index
  vision_score = 0
  while column_index < tree_input[0].length-1
    column_index += 1
    vision_score += 1
    if tree_input[tree_row_index][tree_column_index] <= tree_input[tree_row_index][column_index]
      return vision_score
    end
  end
  vision_score
end

tree_input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}
scenic_score = []
for tree_row_index in 0...tree_input.length
  for tree_column_index in 0...tree_input.length
    #total += 1 if check_up(tree_input, tree_row_index, tree_column_index) || check_down(tree_input, tree_row_index, tree_column_index) || check_left(tree_input, tree_row_index, tree_column_index) || check_right(tree_input, tree_row_index, tree_column_index)
    scenic_score.append(check_up(tree_input, tree_row_index, tree_column_index) * check_down(tree_input, tree_row_index, tree_column_index) * check_left(tree_input, tree_row_index, tree_column_index) * check_right(tree_input, tree_row_index, tree_column_index))
  end
end

p scenic_score.max


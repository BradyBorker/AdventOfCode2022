def move_head(head, direction)
  if direction == 'U'
    head[1] += 1
  elsif direction == 'D'
    head[1] -= 1
  elsif direction == 'L'
    head[0] -= 1
  elsif direction == 'R'
    head[0] += 1
  end
  head
end

def find_distance_between(head, tail)
  Math::sqrt((head[0]-tail[0])**2 + (head[1] - tail[1])**2).floor
end

def diag_position_sign(head_position, knot_position)
  x = (head_position[0] - knot_position[0])
  y = (head_position[1] - knot_position[1])
  return 'up_right' if x >= 0 && y >= 0
  return 'up_left' if x.negative? && y >= 0
  return 'down_right' if x >= 0 && y.negative?
  return 'down_left' if x.negative? && y.negative?
 end

def move_knot_diag(knot_position, position_sign)
  if position_sign == 'up_right'
    knot_position[0] += 1
    knot_position[1] += 1
    return knot_position
  elsif position_sign == 'up_left'
    knot_position[0] -= 1
    knot_position[1] += 1
    return knot_position
  elsif position_sign == 'down_right'
    knot_position[0] += 1
    knot_position[1] -= 1
  elsif position_sign == 'down_left'
    knot_position[0] -= 1
    knot_position[1] -= 1
  end
end

def horz_or_vert(head_position, knot_position)

end

def move_knot_horz_vert(knot_position)
  
end

input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}
# x, y coords
head_position = [0, 0]
knots = [[0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0], [0,0]]

# 8 == tail
previous_head_position = head_position.dup 
visited = []
visited.append(knots[8])

for command in input
  direction = command.split(' ')[0]
  amount = command.split(' ')[1]
  
  amount.to_i.times do
    previous_head_position = head_position.dup

    head_position = move_head(head_position, direction)

    knots.each_with_index do |knot_position, knot_number|
      if knot_number == 0 # First after head
        if find_distance_between(head_position, knot_position) > 2
          # Diag
          # find diag left, diag right, diag neg left, diag neg right
          position_sign = diag_position_sign(head_position, knot_position)
          # Use this to determine new knot position
          knot_position = move_knot_diag(head_position, knot_position, position_sign)

        else
          # Horz or Vert
          horz_vert = horz_or_vert(head_position, knot_position)

        end
      else
        if find_distance_between(knots[knot_number - 1], knot_position) > 2
          # Diag
          p coord_neg_or_pos(head_position, knot_position)
        else
          # Horz or vert
        end
      end
    end
  end
end

visited.uniq.length
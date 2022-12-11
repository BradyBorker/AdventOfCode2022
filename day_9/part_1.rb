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

input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}
# x, y coords
tail = [0, 0]
head = [0, 0]
previous_head_location = head.dup
visited = []
visited.append(tail)

for command in input
  direction = command.split(' ')[0]
  amount = command.split(' ')[1]
  
  amount.to_i.times do
    previous_head_location = head.dup

    head = move_head(head, direction)

    if find_distance_between(head, tail) > 1
      tail = previous_head_location
      visited.append(tail)
    end
  end
end

p visited.uniq.length
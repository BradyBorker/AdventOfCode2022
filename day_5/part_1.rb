def move_crates(commands, crate_stacks)
  amount_to_move = commands[0]
  from = commands[1]
  to = commands[2]

  commands.each do |command|
    p command
  end
end

def parse_line(row_of_crates, crate_stacks)
  stack_number = 1
  row_of_crates.each do |crate|
    crate_stacks[stack_number] += [crate.strip()[1]]
    stack_number += 1
  end 
  crate_stacks
end

crate_stacks = Hash.new([])
commands = []
File.open('input.txt', 'r').each_with_index do |line, line_num|
  if line_num < 8
    row_of_crates = line.chars.each_slice(4).map(&:join)
    parse_line(row_of_crates, crate_stacks)
  elsif line_num > 9
    commands += [line.split("\n").join.split('move').join().split('from').join.split('to').join.split]
  end
  crate_stacks.values.each {|value| value.compact!}
end  

moved_crates = move_crates(commands, crate_stacks)




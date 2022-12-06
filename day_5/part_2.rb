def parse_line(row_of_crates, crate_stacks)
  stack_number = 1
  row_of_crates.each do |crate|
    crate_stacks[stack_number] += [crate.strip()[1]]
    stack_number += 1
  end 
  crate_stacks
end

def move_crates(commands, crate_stacks)
  transition = []
  commands.each do |command|
    amount_to_move = command[0].to_i
    from = command[1].to_i
    to = command[2].to_i

    amount_to_move.times do 
      transition.unshift(crate_stacks[from].shift)
    end

    transition.each do |crate|
      crate_stacks[to].unshift(crate)
    end
    transition = []
  end
  crate_stacks
end

def find_top_crate_each_stack(moved_crates)
  top_letters = ''
  moved_crates.values.each do |stack|
    top_letters += stack[0]
  end
  top_letters
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

p find_top_crate_each_stack(moved_crates)
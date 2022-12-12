def check_cycle(cycles, value, cycle_signal_strenghts)
  if (cycles - 20) % 40 == 0
    signal_strength = cycles * value.to_i
    cycle_signal_strenghts[cycles] = signal_strength
  end
  return cycle_signal_strenghts
end

input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

cycles = 0
value = 1

cycle_signal_strenghts = Hash.new()

for commands in input
  signal_name = commands.split(' ')[0]
  value_to_add = commands.split(' ')[1]

  if signal_name == 'addx'
    2.times do 
      cycles += 1
      check_cycle(cycles, value, cycle_signal_strenghts)
    end
    value += value_to_add.to_i
  else
    cycles += 1
    check_cycle(cycles, value, cycle_signal_strenghts)
  end
end

p cycle_signal_strenghts.values.reduce {|sum, num| sum + num}
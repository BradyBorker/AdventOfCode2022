monkey_list = {
  'monkey 0': { 
    items: [73, 77], 
    operation: " * 5", 
    test: " % 11", 
    true: 'monkey 6', 
    false: 'monkey 5', 
    inspection_count: 0
  },
  'monkey 1': {
    items: [57, 88, 80],
    operation: " + 5",
    test: " % 19",
    true: "monkey 6",
    false: "monkey 0",
    inspection_count: 0
  },
  'monkey 2': {
    items: [61, 81, 84, 69, 77, 88],
    operation: " * 19",
    test: " % 5",
    true: "monkey 3",
    false: "monkey 1",
    inspection_count: 0
  },
  'monkey 3': {
    items: [78, 89, 71, 60, 81, 84, 87, 75],
    operation: " + 7",
    test: " % 3",
    true: "monkey 1",
    false: "monkey 0",
    inspection_count: 0
  },
  'monkey 4': {
    items: [60, 76, 90, 63, 86, 87, 89],
    operation: " + 2",
    test: " % 13",
    true: "monkey 2",
    false: "monkey 7",
    inspection_count: 0
  },
  'monkey 5': {
    items: [88],
    operation: " + 1",
    test: " % 17",
    true: "monkey 4",
    false: "monkey 7",
    inspection_count: 0
  },
  'monkey 6': {
    items: [84, 98, 78, 85],
    operation: "*",
    test: " % 7",
    true: "monkey 5",
    false: "monkey 4",
    inspection_count: 0
  },
  'monkey 7': {
    items: [98, 89, 78, 73, 71],
    operation: " + 4",
    test: " % 2",
    true: "monkey 3",
    false: "monkey 2",
    inspection_count: 0
  }
}

round = 1
while round <= 20
  for monkey_name in monkey_list.keys
    if monkey_list[monkey_name][:items].length == 0
      puts "BREAKING"
      next
    end

    puts "MONKEY HERE: #{monkey_name}"
    for item in monkey_list[monkey_name][:items]
      p "ITEM: #{item}"
      puts "Monkey inspects item with worry level of #{item}"
      if monkey_name.to_s == 'monkey 6'
        worry_level = item * item
      else
        worry_level = eval(item.to_s + monkey_list[monkey_name][:operation])
      end

      puts "Worry level updated by #{monkey_list[monkey_name][:operation]} to #{worry_level}"
      worry_level = worry_level / 3
      puts "divided by 3: #{worry_level}"
      puts "TESTING: #{worry_level.to_s} and #{monkey_list[monkey_name][:test]} "
      if eval(worry_level.to_s + monkey_list[monkey_name][:test]) == 0
        puts "worry level is divisible by #{monkey_list[monkey_name][:test]}"
        puts "item with worry level: #{worry_level} thrown to #{monkey_list[monkey_name][:true]}"
        monkey_list[monkey_list[monkey_name][:true].to_sym][:items].append(worry_level)
      else
        puts "worry level is not divisible by #{monkey_list[monkey_name][:test]}"
        puts "item with worry level: #{worry_level} thrown to #{monkey_list[monkey_name][:false]}"
        monkey_list[monkey_list[monkey_name][:false].to_sym][:items].append(worry_level)
      end
    end
    monkey_list[monkey_name][:inspection_count] += monkey_list[monkey_name][:items].length
    monkey_list[monkey_name][:items] = []
  end
  round += 1
  puts "ROUND: #{round}"
end

inspection_count = []
for monkey in monkey_list.keys
  inspection_count.push(monkey_list[monkey][:inspection_count])
end

p inspection_count.sort()[-2..-1].reduce {|sum, value| sum * value}
def find_common_item(container1, container2)
  container1.split('').each do |char|
    return char if container2.include?(char)
  end
end

def sum_common_items(input, priorities)
  sum_common_items = 0
  input.each do |container|
    common_item = find_common_item(container[0...container.length / 2], container[container.length / 2..])
    sum_common_items += priorities[common_item]
  end
  sum_common_items
end

def priorities(priority = {})
  lower_counter = 1
  upper_counter = 27

  ('a'..'z').each do |char|
    priority[char] = lower_counter
    priority[char.upcase] = upper_counter
    lower_counter += 1
    upper_counter += 1
  end
  priority
end

input = File.open('input.txt', 'r') do |file|
  file.readlines.join.split("\n")
end

p sum_common_items(input, priorities)

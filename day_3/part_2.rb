def group_by_three(input)
  grouped_input = []
  temp = []
  for rucksack in input 
    temp.append(rucksack)
    if temp.length == 3
      grouped_input.append(temp)
      temp = []
    end
  end
  grouped_input
end

def find_badges(grouped_input)
  badges = []
  for group in grouped_input
    for char in group[0].split('')
      if group[1].include?(char) && group[2].include?(char)
        badges.append(char)
        break
      end
    end
  end
  badges
end

def sum_badges(badges, priorities)
  sum = 0
  badges.each {|badge| sum += priorities[badge]}
  sum
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

input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

grouped_input = group_by_three(input)

badges = find_badges(grouped_input)

p sum_badges(badges, priorities)
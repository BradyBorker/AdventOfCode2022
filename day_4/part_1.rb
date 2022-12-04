def format_assignment_times(input)
  formatted_assignment_times = {}
  input.each_with_index do |assignment, index|
    pairs = assignment.split(",")
    elf_1 = pairs[0].split("-")
    elf_2 = pairs[1].split("-")
    
    formatted_assignment_times[index] = [elf_1, elf_2]
  end
  formatted_assignment_times
end

def is_contained(lower_1, upper_1, lower_2, upper_2)
  return true if lower_1 <= lower_2 && upper_1 >= upper_2 || lower_2 <= lower_1 && upper_2 >= upper_1
end

def find_contained_pairs(assignment_times)
  contained_pairs = 0
  for assignments in assignment_times.values
    lower_1 = assignments[0][0].to_i
    upper_1 = assignments[0][1].to_i
    lower_2 = assignments[1][0].to_i
    upper_2 = assignments[1][1].to_i
    
    contained_pairs += 1 if is_contained(lower_1, upper_1, lower_2, upper_2)
  end
  contained_pairs
end

input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

assignment_times = format_assignment_times(input)

p find_contained_pairs(assignment_times)

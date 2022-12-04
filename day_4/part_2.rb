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

def crosses_bounds(lower_1, upper_1, lower_2, upper_2)
  return true if lower_2 <= upper_1 && upper_2 >= upper_1 || upper_2 >= lower_1 && lower_1 >= lower_2
end

def find_overlap(formatted_input)
  overlap = 0
  for assignments in formatted_input.values 
    low_1 = assignments[0][0].to_i
    up_1 = assignments[0][1].to_i
    low_2 = assignments[1][0].to_i
    up_2 = assignments[1][1].to_i

    overlap += 1 if is_contained(low_1, up_1, low_2, up_2) || crosses_bounds(low_1, up_1, low_2, up_2)
  end
  overlap
end

input = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

formatted_input = format_assignment_times(input)

p find_overlap(formatted_input)

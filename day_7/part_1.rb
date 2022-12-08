def update_current_directory(dir, pwd)
  if dir == '..'
    pwd.pop() 
    return pwd
  else
    return pwd.append(dir)
  end
end

def add_up_all_directories(file_paths_and_sizes, path_sizes=Hash.new(0))
  if file_paths_and_sizes.length == 0
    return path_sizes
  end
  
  paths, size = file_paths_and_sizes.first
  
  for index in 0..paths[0..-2].length-1
    path_sizes[paths[0..index]] += size
  end

  file_paths_and_sizes.shift
  
  add_up_all_directories(file_paths_and_sizes, path_sizes)
end

def find_directory_to_delete(added_up)
  unused_space = 70_000_000 - added_up[["/"]]
  can_be_deleted = []
  added_up.values.each do |amount|
    if unused_space + amount >= 30_000_000
      can_be_deleted.append(amount)
    end
  end
  can_be_deleted.min
end

input_list = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

pwd = []
file_paths_and_sizes = Hash.new()
input_list.each do |input|
  if input[0..3] == "$ cd"
    update_current_directory(input[5..], pwd)
  elsif input[0..3] != "$ ls" && input[0..3] != "$ cd" && input.split(' ')[0] != 'dir'
    file_paths_and_sizes[pwd + [input.split[1]]] = input.split[0].to_i
  end
end

added_up = add_up_all_directories(file_paths_and_sizes)

# part_1 answer:
p added_up.values.select {|num| num <= 100_000}.sum

# part_2 answer:
p find_directory_to_delete(added_up)


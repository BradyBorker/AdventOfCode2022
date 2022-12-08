def update_current_directory(dir, pwd)
  if dir == '..'
    pwd.pop() 
    return pwd
  else
    return pwd.append(dir)
  end
end

def add_up_all_sizes(file_sizes)
  file_sizes.each do |path_size|
    path = path_sizes[0]
    size = path_sizes[1]
    path[0..-1].each do |x|
      p x
    end
  end
end

input_list = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

pwd = []
file_sizes = Hash.new()
input_list.each do |input|
  if input[0..3] == "$ cd"
    update_current_directory(input[5..], pwd)
  elsif input[0..3] != "$ ls" && input[0..3] != "$ cd" && input.split(' ')[0] != 'dir'
    file_sizes[pwd + [input.split(' ')[1]]] = input.split[0].to_i
  end
end

add_up_all_sizes(file_sizes)
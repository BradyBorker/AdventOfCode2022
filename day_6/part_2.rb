def find_marker(input_string)
  four_chars = []
  input_string.split('').each_with_index do |char, index|
    if four_chars.length < 14 
      four_chars.append(char)
    end

    if four_chars.length == 14 && four_chars.length != four_chars.uniq.length 
      four_chars.shift
    elsif four_chars.length == 14 && four_chars.length == four_chars.uniq.length 
      return index + 1
    end
  end
end

input = File.open('input.txt', 'r') {|file| file.readlines.join}

p find_marker(input)
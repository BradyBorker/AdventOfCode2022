def add_pixel(pixel_display, sprite_position)
  if pixel_display['pixels_index'] == sprite_position-1 || pixel_display['pixels_index'] == sprite_position || pixel_display['pixels_index'] == sprite_position+1
    pixel_display['pixels'].push("#")
  else   
    pixel_display['pixels'].push(".")
  end
  return pixel_display
end

def check_length(pixel_display)
  if pixel_display['pixels'].length == 40
    pixel_display['crt'].push(pixel_display['pixels'].dup)
    pixel_display['pixels'] = []
    pixel_display['pixels_index'] = 0
  end
  return pixel_display
end

commands = File.open('input.txt', 'r') {|file| file.readlines.join.split("\n")}

sprite_position = 1
cycle = 0

pixel_display = {'crt' => [], 'pixels' => [], 'pixels_index' => 0}

for command in commands
  signal_name = command.split(' ')[0]
  value = command.split(' ')[1]

  if signal_name == 'addx'
    2.times do |idx|
      cycle += 1
      add_pixel(pixel_display, sprite_position)
      pixel_display['pixels_index'] += 1
      check_length(pixel_display)
    end
    sprite_position += value.to_i
  else
    cycle += 1
    add_pixel(pixel_display, sprite_position)
    pixel_display['pixels_index'] += 1
    check_length(pixel_display)
  end

end

pixel_display['crt'].each do |row|
  p row.join
end
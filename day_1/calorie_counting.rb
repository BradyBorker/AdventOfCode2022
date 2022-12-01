def calorie_counting(array)
  elf_number = 1
  calorie_total = {}
  for elf in array
    sum = 0
    amount_carrying = elf.split("\n")
    amount_carrying.each {|num| sum += num.to_i}  
    calorie_total[elf_number] = sum
    elf_number += 1
  end
  return calorie_total
end

def find_elf_carrying_most_calories(dictionary)
  greatest_amount = 0
  elf = ''
  for elf_number, amount in dictionary
    if amount > greatest_amount
      greatest_amount = amount
      elf = elf_number
    end
  end
  greatest_amount_of_calories = {elf => greatest_amount}
  return greatest_amount_of_calories
end

calories = File.open('elf_calories.txt', 'r') do |file|
  file.readlines.join
end

calories_dict = calorie_counting(calories.split("\n\n"))
p find_elf_carrying_most_calories(calories_dict)
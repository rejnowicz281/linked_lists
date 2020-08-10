require_relative "lists.rb"

list = LinkedList.new

puts "Innitial list: #{list}"

list.append(1)
# (head)[1, next->]->nil

puts "Append 1: #{list}"

list.preppend(5)
# (head)[5, next->]->[1, next->]->nil

puts "Preppend 5: #{list}"

list.preppend(7)
# (head)[7, next->]->[5, next->]->[1, next->]->nil

puts "Preppend 7: #{list}"

list.preppend(0)
# (head)[0, next->]->[7, next->]->[5, next->]->[1, next->]->nil

puts "Preppend 0: #{list}"

list.append(11)
# (head)[0, next->]->[7, next->]->[5, next->]->[1, next->]->[11, next->]->nil

puts "Append 11: #{list}"

list.append(17)
# (head)[0, next->]->[7, next->]->[5, next->]->[1, next->]->[11, next->]->[17, next->]->nil

puts "Append 17: #{list}"

list.pop
# (head)[0, next->]->[7, next->]->[5, next->]->[1, next->]->[11, next->]->nil

puts "Pop the last node: #{list}"

list.insert_at(3, 2)
# (head)[0, next->]->[7, next->]->[3, next->]->[5, next->]->[1, next->]->[11, next->]->nil

puts "Insert 3 at index 2: #{list}"

list.insert_at(1, 3)
# (head)[0, next->]->[7, next->]->[3, next->]->[1, next->]->[5, next->]->[1, next->]->[11, next->]->nil

puts "Insert 1 at index 3: #{list}"

list.remove_at(4)
# (head)[0, next->]->[7, next->]->[3, next->]->[1, next->]->[1, next->]->[11, next->]->nil

puts "Remove element at index 4: #{list}"

puts

puts "head: #{list.head.value}"
puts "tail: #{list.tail.value}"
puts "size: #{list.size}"
puts "at index 4: #{list.at(4)}"
puts "list contains 11? #{list.contains?(11)}"
puts "find 11's index: #{list.find(11)}"
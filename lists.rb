class LinkedList
  attr_reader :size, :head

  def initialize
    @head = nil
    @size = 0
  end

  def append(value)
    @size += 1
    if @head == nil 
      @head = Node.new(value)
    else
      tail.next_node=(Node.new(value))
    end
  end

  def preppend(value)
    @size += 1
    if @head == nil
      @head = Node.new(value)
    else
      @head = Node.new(value, @head)
    end
  end

  def tail
    return "nil" if @head == nil

    current = @head 
    until current.next_node == nil 
      current = current.next_node
    end

    current
  end

  def at(index)
    return "There is nothing to search for" if @head == nil
    index = 0 if index < 0

    current = @head
    i = 0
    until current == nil
      if i == index 
        return current.value
      else
        current = current.next_node
        i += 1
      end
    end
  end

  def pop
    return (puts "There is nothing to pop") if @head == nil

    current = @head
    until current == tail 
      if current.next_node == tail 
        current.next_node=(nil)
        @size -= 1
      else
        current = current.next_node
      end
    end
  end

  def contains?(value)
    return "The list doesn't contain anything" if @head == nil

    current = @head 
    until current == nil 
      if current.value == value 
        return true 
      elsif current.value != value && current.next_node == nil
        return false 
      end
      current = current.next_node
    end
  end

  def find(value)
    return "There is nothing to find in this list" if @head == nil

    current = @head
    i = 0
    until current == nil
      if current.value == value 
        return i
      elsif current.value != value && current.next_node == nil
        return "nil"
      end
      current = current.next_node
      i += 1
    end
  end

  def to_s
    return "nil -> nil" if @head == nil

    current = @head
    final = "" 
    until current == nil 
      final += "#{current.value} -> "
      current = current.next_node
      final += "nil" if current == nil
    end

    final
  end

  def insert_at(value, index)
    if index > size - 1 
      return append(value)
    elsif index < 0
      return preppend(value)
    end

    current = @head 
    loop do 
      if current.next_node.value == at(index)
        current.next_node=(Node.new(value, current.next_node))
        @size += 1
        break
      end
      current = current.next_node
    end
  end

  def remove_at(index)
    if index > size - 1
      index = size - 1
    elsif index < 0
      @size -= 1
      return @head = Node.new(@head.next_node.value, @head.next_node.next_node)
    end

    current = @head 
    loop do 
      if current.next_node.value == at(index)
        current.next_node=(current.next_node.next_node)
        @size -= 1
        break
      end
      current = current.next_node
    end
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value 
    @next_node = next_node
  end
end
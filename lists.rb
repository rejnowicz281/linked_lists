class Node 
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
      @value = value
      @next_node = next_node
  end     
end 

class LinkedList
  attr_accessor :head

  def initialize 
      @head = Node.new
  end
  
  def append(value)
      if head.value == nil 
          head.value = value
      else
          tail.next_node = Node.new(value)
      end
  end 

  def preppend(value)
      if head.value == nil 
          head.value = value
      else 
          temp_head = head
          self.head = Node.new(value, temp_head)
      end
  end 

  def size 
      size = 0 
      if head.value == nil && head.next_node == nil 
          size 
      else
          current_node = head 
          until current_node == nil 
              size += 1
              current_node = current_node.next_node
          end 
          size
      end 
  end     

  def tail 
      current_node = head 
      current_node = current_node.next_node until current_node.next_node == nil 
      current_node
  end 

  def at(index)
      if index < size && index >= 0 
          i = 0 
          current_node = head 
          until i == index
              i += 1
              current_node = current_node.next_node
          end 
          current_node
      else
          "Invalid index"
      end 
  end 

  def pop 
      current_node = head 
      current_node = current_node.next_node until current_node.next_node == tail
      current_node.next_node = nil
  end     

  def contains?(value)
      current_node = head 
      contain = false
      until current_node == tail 
          contain = true if current_node.value == value || current_node.next_node.value == value 
          current_node = current_node.next_node
      end 
      contain
  end 

  def find(value)
      if contains?(value)
          idx = 0
          current_node = head 
          until current_node.value == value
              current_node = current_node.next_node
              idx += 1
          end 
          idx 
      else
          nil
      end
  end 

  def insert_at(value,index)
      if index < size && index > 0 
          i = 0
          current_node = head 
          until i+1 == index
              i += 1
              current_node = current_node.next_node
          end 
          temp_next_node = current_node.next_node
          current_node.next_node = Node.new(value, temp_next_node)
      elsif index == 0
          preppend(value) 
      else
          puts "Invalid index"
      end 
  end 

  def remove_at(index)
      if size == 0 
          puts "Nothing to remove."
      elsif size == 1
          self.head = Node.new
      elsif index < size && index > 0 
          i = 0 
          current_node = head 
          until i+1 == index
              i += 1
              current_node = current_node.next_node
          end 
          current_node.next_node = current_node.next_node.next_node
      elsif index == 0
          self.head = head.next_node
      else
          puts "Invalid index"
      end 
  end 

  def to_s 
      preview = ""
      current_node = head
      until current_node == nil
          preview += "(#{current_node.value}) => "
          preview += "nil" if current_node == tail
          current_node = current_node.next_node
      end 
      preview
  end 
end 

list = LinkedList.new 
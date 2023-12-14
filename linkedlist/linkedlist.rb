class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_reader :head

  def append(value)
    return @head = Node.new(value) if @head.nil?

    tmp = @head
    tmp = tmp.next_node until tmp.next_node.nil?
    tmp.next_node = Node.new(value)
  end

  def prepend(value)
    tmp = Node.new(value)
    tmp.next_node = @head unless @head.nil?
    @head = tmp
  end

  def size
    return 0 if @head.nil?

    tmp = @head
    size = 1
    until tmp.next_node.nil?
      tmp = tmp.next_node
      size += 1
    end

    size
  end

  def tail
    return nil if @head.nil?

    tmp = @head
    until tmp.next_node.nil?
      tmp = tmp.next_node
    end

    tmp
  end

  def at(index)
    return nil if @head.nil?

    tmp = @head
    pos = 0

    until pos == index
      tmp = tmp.next_node
      pos += 1
    end

    tmp
  end

  def contains?(value)
    return false if @head.nil?

    tmp = @head
    until tmp.next_node.nil?
      return true if tmp.value == value
      tmp = tmp.next_node
    end

    false
  end
end

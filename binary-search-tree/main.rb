class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data = data
  end

  def is_leaf?
    return true if @left.nil? && @right.nil?
    false
  end
end

class Tree
  attr_accessor :root

  def initialize(array)
    array.uniq!
    array.sort!
    @root = build_tree(array, 0, array.size - 1)
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? "│   " : "    "}", false) if node.right
    puts "#{prefix}#{is_left ? "└── " : "┌── "}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? "    " : "│   "}", true) if node.left
  end

  def insert(data)
    return "Insertion skipped - duplicate data: #{data}" if find_node(data)

    parent = find_parent(data)

    node = Node.new(data)
    (data > parent.data) ? (parent.right = node) : (parent.left = node)

    "Insertion completed: #{data}"
  end

  # private

  def build_tree(array, start, finish)
    return nil if start > finish

    mid = (start + finish) / 2
    node = Node.new(array[mid])
    node.left = build_tree(array, start, mid - 1)
    node.right = build_tree(array, mid + 1, finish)
    node
  end

  def find_parent(data)
    parent, child = nil, @root

    until child.data == data
      parent = child

      child = (data > parent.data) ? parent.right : parent.left

      return parent if child.nil?
    end

    parent
  end

  def find_node(data)
    node = @root

    until node.data == data
      node = (data > node.data) ? node.right : node.left
      return nil if node.nil?
    end

    node
  end
end

array = Array.new(9) { rand(1..100) }
# array = [1, 27, 32, 38, 53, 55, 67, 78, 94]

tree = Tree.new(array)
puts "Array: #{array.uniq.sort}"
puts "Search Tree:"
tree.pretty_print
puts tree.insert(rand(1..100))
tree.pretty_print

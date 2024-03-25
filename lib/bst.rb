# Node class
class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

# Tree class
class Tree
  attr_accessor :node

  def initialize(array)
    @root = build_tree(array.sort.uniq)
  end

  def build_tree(array)
    return nil if array.empty?

    middle = array.length / 2

    node = Node.new(array.at(middle))

    node.left = build_tree(array[...middle])
    node.right = build_tree(array[middle + 1...])
    node
  end

  def insert(value, node = @root)
    return Node.new(value) if node.nil?

    return 'value already exist' if node.value == value

    if value < node.value
      node.left = insert(value, node.left)
    else
      node.right = insert(value, node.right)
    end
    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.value
      node.left = delete(value, node.left)
    elsif value > node.value
      node.right = delete(value, node.right)
    else
      # Delete the node for different cases
      if node.left.nil?
        return node.right
      elsif node.right.nil?
        return node.left
      else
        puts node.value
        parent = node
        succ = node.right
        puts "parent: #{parent.value}"
        puts "successor: #{succ.value}"
        while succ.left != nil
          parent = succ
          succ = succ.left
          puts "parent: #{parent.value}"
          puts "successor: #{succ.value}"
        end

        if parent != node
          p parent.left = succ.right
        else
          parent.right = succ.right
        end
        node.value = succ.value
      end
    end
    node
  end

  def find(value, node = @root)
    return 'no value found' if node.nil?

    return node.value if node.value == value

    if value < node.value
      node.left = find(value, node.left)
    else
      node.right = find(value, node.right)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

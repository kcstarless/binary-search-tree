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
  # attr_accessor :node

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

    return node if node.value == value

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
    return nil if node.nil?

    return node if node.value == value

    if value < node.value
      find(value, node.left)
    else
      find(value, node.right)
    end
  end

  # Write a level_order method which accepts a block. This method should
  # traverse the tree in breadth-first level order and yield each node to the provided block.

  def level_order(node = @root, queue = [], list = [])
    return nil if node.nil?

    queue.append(node)

    until queue.empty?
      node = queue.shift

      yield node if block_given?

      list.append(node.value)

      queue.append(node.left) if node.left
      queue.append(node.right) if node.right
    end
    list
  end

  # Write #inorder, #preorder, and #postorder methods that accepts a block.
  # Each method should traverse the tree in their respective depth-first order
  # and yield each node to the provided block. The methods should return an array of values
  # if no block is given.

  def inorder(node = @root, list = [], &block)
    return nil if node.nil?

    inorder(node.left, list, &block)
    block_given? ? block.call(node) : list.append(node.value)
    inorder(node.right, list, &block)
    list
  end

  def preorder(node = @root, list = [], &block)
    return nil if node.nil?

    block_given? ? block.call(node) : list.append(node.value)
    preorder(node.left, list, &block)
    preorder(node.right, list, &block)
    list
  end

  def postorder(node = @root, list = [], &block)
    return nil if node.nil?

    postorder(node.left, list, &block)
    postorder(node.right, list, &block)
    block_given? ? block.call(node) : list.append(node.value)
    list
  end

  def height(node)
    return -1 if node.nil?

    left_height = height(node.left) + 1
    right_height = height(node.right) + 1

    [left_height, right_height].max
  end

  def depth(node, start = @root, count = 0)
    return count if start.nil?

    return count if node.value == start.value

    if node.value < start.value
      depth(node, start.left, count + 1)
    else
      depth(node, start.right, count + 1)
    end
  end

  def balanced?(node = @root)
    return true if node.nil?

    left_height = height(node.left).abs
    right_height = height(node.right).abs

    return false if (left_height - right_height).abs > 1

    balanced?(node.left) && balanced?(node.right)
  end

  def rebalance
    @root = build_tree(inorder)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end

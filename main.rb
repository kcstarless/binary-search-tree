require_relative 'lib/bst'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

tree = Tree.new(array)
tree.pretty_print
# tree.insert(2)
# tree.insert(24)
# tree.insert(25)
# tree.pretty_print
# tree.delete(4)
# puts tree.find(2324)
# tree.level_order { |node| puts node.value if node.value == 7 }
# tree.level_order
# puts tree.find(4)

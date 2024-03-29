require_relative 'lib/bst'

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

# tree = Tree.new(array)
# tree.pretty_print
# tree.insert(2)
# tree.insert(24)
# tree.insert(25)
# tree.insert(66)
# tree.insert(77)
# # tree.pretty_print
# # tree.delete(4)
# # puts tree.find(4)
# # tree.level_order { |node| puts node.value if node.value == 7 }
# # tree.level_order
# tree.inorder { |node| puts node.value }
# # tree.preorder { |node| puts node.value }
# # tree.postorder { |node| puts node.value }
# # puts tree.height(tree.find(3))
# # puts "depth: #{tree.depth(tree.find(3))}"
# # tree.pretty_print
# # puts tree.balanced?
# tree.rebalance
# tree.pretty_print
# puts tree.balanced?
# # p tree.inorder
# p tree.find(4)

# Test

tree = Tree.new(Array.new(15) { rand(1..100) })

tree.pretty_print

puts "Tree balanced? #{tree.balanced?}"
puts "Level order: #{tree.level_order}"
puts "Inorder: #{tree.inorder}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"

tree.insert(2)
tree.insert(24)
tree.insert(25)
tree.insert(66)
tree.insert(77)

tree.pretty_print
puts "Tree balanced? #{tree.balanced?}"
tree.rebalance
tree.pretty_print
puts "Tree balanced? #{tree.balanced?}"

puts "Level order: #{tree.level_order}"
puts "Inorder: #{tree.inorder}"
puts "Preorder: #{tree.preorder}"
puts "Postorder: #{tree.postorder}"

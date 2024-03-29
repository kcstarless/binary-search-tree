# binary-search-tree

## 1. Description
This project implements a balanced binary search tree. With time complexity of #O(log n) and space complexity of #O(n). It is fast and efficient data structure.

## 2. Usage
Rung the program by entering #ruby main.rb on your terminal. It will run series of test to demonstrate it's functions. 

## 3. In detail
Program has two classes, `#Node` & `#Tree`, and later containing many different methods such as:
- `#build_tree` method accepts an array and build the tree structure.
- `#insert` & `#delete` method inserts and deletes a entry from the existing tree stucture. 
- `#find` method which accepts a value and returns the node with the given value.
- `#level_order` method which accepts a `block` and traverse the tree in breadth-first level order and yields each node to the provided block. 
- `#inorder`, `#preorder`, and `#postorder` methods that accepts a block. Each method should traverse the tree in their respective depth-first order and yield each node to the provided block. 
- `#height` method that accepts a node and returns its height.
- `#depth` method that accepts a node and returns its depth.
- `#balanced?` method that checks if the tree is balanced.
- `#rebalance` method which rebalances an unbalanced tree.

## 4. Thoughts on the project
Lot of recursive logics was used on this project giving me more practice on this somewhat confusing topic. Solutions using recursive method is very simple and elegant in a way but more understanding of stack flow is needed I feel. 
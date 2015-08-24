require 'rubygems'
require 'decisiontree'

attributes = ['Temperature']
training = [
  [92.5, 'really sick'],
  [95.5, 'sick'],
  [97.9, 'healthy'],
  [98.6, 'healthy'],
  [98.1, 'healthy'],
  [100.4, 'sick'],
  [102.5, 'sick'],
  [104, 'really sick'],
  [122, 'really sick'],
]

# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 'sick', :continuous)
dec_tree.train

test = [101.5, 'sick']

decision = dec_tree.predict(test)
puts "Predicted: #{decision} ... True decision: #{test.last}";

# Graph the tree, save to 'tree.png'
dec_tree.graph("sickness")

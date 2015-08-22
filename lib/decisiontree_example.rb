require 'decisiontree'
require 'graphr'
require 'pry'

attributes = ['Comb & Waddle', 'Tail Feathers', 'Hackle Feathers', 'Egg Shape']
training = [
  ['medium', 'straight', 'short', 'round', 'female'],
  ['small', 'straight', 'short', 'pointy', 'female'],
  ['medium', 'curved', 'long', 'pointy', 'female'],
  ['large', 'curved', 'long', 'round', 'male'],
  ['small', 'straight', 'long', 'round', 'female'],
  ['large', 'curved', 'long', 'round', 'male'],
  ['small', 'straight', 'short', 'round', 'female'],
  ['medium', 'curved', 'long', 'pointy', 'male'],
  ['large', 'curved', 'short', 'pointy', 'male'],
  ['small', 'curved', 'short', 'round', 'female'],
  ['small', 'straight', 'short', 'pointy', 'female']
  # ... more training examples
]


# Instantiate the tree, and train it based on the data (set default to '1')
dec_tree = DecisionTree::ID3Tree.new(attributes, training, 'female', :discrete)
dec_tree.train

test = ['small', 'curved', 'short', 'pointy', 'female']

decision = dec_tree.predict(test)
puts "Predicted: #{decision} ... True decision: #{test.last}";

# Graph the tree, save to 'tree.png'
dec_tree.graph("tree")

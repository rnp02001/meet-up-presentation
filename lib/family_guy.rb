require 'rubygems'
require 'decisiontree'
require 'graphr'

  attributes = ['Age', 'Education', 'Income', 'Marital Status']
  training = [
    ['36-55', 'Masters', 'High', 'Single', 1],
    ['18-35', 'High School', 'Low', 'Single', 0],
    ['< 18', 'High School', 'Low', 'Married', 1],
    ['18-35', 'Bachelors', 'High', 'Single', 0],
    ['< 18', 'High School', 'Low', 'Single', 1],
    ['18-35',	'Bachelors', 'High', 'Married',	0],
    ['36-55',	'Bachelors', 'Low', 'Married', 0],
    ['> 55', 'Bachelors', 'High', 'Single',	1],
    ['36-55',	'Masters', 'Low', 'Married', 0],
    ['> 55', 'Masters', 'Low', 'Married',	1],
    ['36-55', 'Masters', 'High', 'Single', 1],
    ['> 55', 'Masters', 'High', 'Single',	1],
    ['< 18', 'High School', 'High', 'Single',	0],
    ['36-55',	'Masters', 'Low', 'Single',	1],
    ['36-55', 'High School', 'Low', 'Single',	1],
    ['< 18', 'High School', 'Low', 'Married',	1],
    ['18-35', 'Bachelors', 'High', 'Married',	0],
    ['> 55', 'High School', 'High', 'Married', 1],
    ['> 55', 'Bachelors', 'Low', 'Single', 1],
    ['36-55', 'High School', 'High', 'Married',	0]
    # ... more training examples
  ]

  def graph(filename, file_type = "png")
    require 'graphr'
    dgp = DotGraphPrinter.new(build_tree)
    dgp.write_to_file("#{filename}.#{file_type}", file_type)
  end

  def build_tree(tree = @tree)
      return [] unless tree.is_a?(Hash)
      return [["Always", @default]] if tree.empty?

      attr = tree.to_a.first

      links = attr[1].keys.collect do |key|
        parent_text = "#{attr[0].attribute})"
        if attr[1][key].is_a?(Hash) then
          child = attr[1][key].to_a.first[0]
          child_text = "#{child.attribute})"
        else
          child = attr[1][key]
          child_text = "#{child})"
        end
        label_text = "#{key} #{type(attr[0].attribute) == :continuous ? attr[0].threshold : ""}"

        [parent_text, child_text, label_text]
      end
      attr[1].keys.each { |key| links += build_tree(attr[1][key]) }

      return links
    end

  # Instantiate the tree, and train it based on the data (set default to '1')
  dec_tree = DecisionTree::ID3Tree.new(attributes, training, 1, :discrete)
  dec_tree.train

  test = ['< 18', 'High School', 'Low', 'Single', 0]

  decision = dec_tree.predict(test)
  puts "Predicted: #{decision} ... True decision: #{test.last}";

  # Graph the tree, save to 'discrete.png'
  dec_tree.graph("family_guy")

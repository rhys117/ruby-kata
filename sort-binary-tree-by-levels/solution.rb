# return the array containing the tree levels, from root to last level.
def tree_by_levels(node)
  return [] if node&.value.nil?

  nodes_ordered = [node]
  nodes_ordered.each do |current_node|
    next unless current_node.is_a? TreeNode

    nodes_ordered << current_node.left
    nodes_ordered << current_node.right
  end
  nodes_ordered.compact.map(&:value)
end
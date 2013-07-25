class LazyArgument
  def initialize(node_id, context)
    @node_id = node_id
    @context = context
  end

  def resolve
    @result ||= Node.find(@node_id).evaluate(@context)
  end
end

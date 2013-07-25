class Invoke < Node
  belongs_to :fun, :class_name => 'Function', :foreign_key => 'function'

  def self.validate(params)
    nil
  end

  def evaluate
    fun.evaluate(arguments)
  end

  def as_json(*)
    {
      id: id,
      kind: 'invoke',
      function: function,
      arguments: arguments
    }
  end
end

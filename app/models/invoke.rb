class Invoke < Node
  belongs_to :fun, :class_name => 'Function', :foreign_key => 'function'

  def self.validate(params)
    nil
  end

  def args
    arguments || []
  end

  def evaluate(context)
    fun.evaluate(args, context)
  end

  def as_json(*)
    {
      id: id,
      kind: 'invoke',
      function: function,
      arguments: args
    }
  end
end

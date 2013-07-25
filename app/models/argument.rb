class Argument < Node
  def self.validate(params)
    nil
  end

  def evaluate(context)
    context[argument]
  end

  def as_json(*)
    {
      id: id,
      kind: 'argument',
      argument: argument
    }
  end
end

class Constant < Node
  def self.validate(params)
    if params[:value].is_a?(Integer)
      nil
    else
      'Could not parse integer'
    end
  end

  def evaluate
    value
  end

  def as_json(*)
    {
      id: id,
      kind: 'constant',
      type: 'int',
      value: value
    }
  end
end

class Constant < Node
  def self.validate(params)
    case params[:type]
    when 'int' then parse(Integer, params)
    when 'bool' then parse_bool(params)
    when 'string' then parse(String, params)
    end
  end

  def self.parse(klass, params)
    if params[:value].is_a?(klass)
      nil
    else
      "Could not parse #{klass.name.downcase}"
    end
  end

  def self.parse_bool(params)
    if params[:value] == true || params[:value] == false
      nil
    else
      "Could not parse boolean"
    end
  end

  def evaluate(*)
    value
  end

  def as_json(*)
    {
      id: id,
      kind: 'constant',
      type: type,
      value: value
    }
  end
end

class Node < ActiveRecord::Base
  self.inheritance_column = 'kind'

  attr_accessible :value

  def self.of_type(kind)
    case kind
    when 'constant' then Constant
    else Node
    end
  end

  def self.validate(params)
    'abstract class'
  end

  def as_json(*)
    {
      id: id,
      kind: kind.downcase,
      type: 'int',
      value: value
    }
  end
end

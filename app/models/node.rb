class Node < ActiveRecord::Base
  self.inheritance_column = 'kind'

  attr_accessible :value, :arguments, :function

  serialize :arguments


  def self.of_type(kind)
    case kind
    when 'constant' then Constant
    when 'invoke' then Invoke
    else Node
    end
  end

  def self.validate(params)
    'abstract class'
  end

  def evaluate
    nil
  end

  def as_json(*)
    {}
  end
end

class Node < ActiveRecord::Base
  self.inheritance_column = 'kind'

  attr_accessible :value, :arguments, :function, :predicate, :true_branch, :false_branch, :argument

  serialize :arguments


  def self.of_type(kind)
    case kind
    when 'argument' then Argument
    when 'constant' then Constant
    when 'invoke' then Invoke
    when 'if' then If
    else Node
    end
  end

  def self.validate(params)
    'abstract class'
  end

  def evaluate(*)
    nil
  end

  def as_json(*)
    {}
  end
end

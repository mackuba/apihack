class If < Node
  belongs_to :condition, :class_name => 'Node', :foreign_key => 'predicate'
  belongs_to :true_result, :class_name => 'Node', :foreign_key => 'true_branch'
  belongs_to :false_result, :class_name => 'Node', :foreign_key => 'false_branch'

  def self.validate(params)
    nil
  end

  def evaluate(context)
    condition.evaluate(context) ? true_result.evaluate(context) : false_result.evaluate(context)
  end

  def as_json(*)
    {
      id: id,
      kind: 'if',
      predicate: predicate,
      true_branch: true_branch,
      false_branch: false_branch
    }
  end
end

class Function < ActiveRecord::Base
  belongs_to :target, :class_name => 'Node', :foreign_key => 'body'

  attr_accessible :name, :body

  def evaluate(arguments, context)
    values = arguments.map { |a| Node.find(a).evaluate(context) }

    if name
      send(name, values)
    else
      target.evaluate(values)
    end
  end

  def add(values)
    values.inject(&:+)
  end

  def mult(values)
    values.inject(&:*)
  end

  def lt(values)
    values.first < values.second
  end

  def as_json(*)
    {
      id: id,
      body: body
    }
  end
end

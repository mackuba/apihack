class Function < ActiveRecord::Base
  belongs_to :target, :class_name => 'Node', :foreign_key => 'body'

  attr_accessible :name, :body

  def evaluate(arguments, context)
    values = arguments.map { |a| LazyArgument.new(a, context) }

    if name
      send(name, values.map(&:resolve))
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

  def if(values)
    values[0] ? values[1] : values[2]
  end

  def as_json(*)
    {
      id: id,
      body: body
    }
  end
end

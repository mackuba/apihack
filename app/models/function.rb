class Function < ActiveRecord::Base
  attr_accessible :name

  def evaluate(arguments)
    values = arguments.map { |a| Node.find(a).evaluate }

    send(name, values)
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
      id: id
    }
  end
end

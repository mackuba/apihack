class Function < ActiveRecord::Base
  attr_accessible :name

  def evaluate(arguments)
    nodes = arguments.map { |a| Node.find(a) }

    send(name, nodes)
  end

  def add(nodes)
    nodes.map(&:evaluate).inject(&:+)
  end

  def mult(nodes)
    nodes.map(&:evaluate).inject(&:*)
  end

  def as_json(*)
    {
      id: id
    }
  end
end

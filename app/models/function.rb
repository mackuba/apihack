class Function < ActiveRecord::Base
  attr_accessible :name

  def evaluate(arguments)
    nodes = arguments.map { |a| Constant.find(a) }

    send(name, nodes)
  end

  def add(nodes)
    nodes.sum(&:value)
  end

  def as_json(*)
    {
      id: id
    }
  end
end

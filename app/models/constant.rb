class Constant < ActiveRecord::Base
  attr_accessible :value

  def as_json(*)
    {
      id: id,
      kind: 'constant',
      type: 'int',
      value: value
    }
  end
end

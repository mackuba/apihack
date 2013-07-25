class Function < ActiveRecord::Base
  attr_accessible :name

  def as_json(*)
    {
      id: id
    }
  end
end

class Constant < Node
  def self.validate(params)
    if params[:value].is_a?(Integer)
      nil
    else
      'Could not parse integer'
    end
  end
end

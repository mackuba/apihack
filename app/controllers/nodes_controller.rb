class NodesController < ApplicationController
  def show
    @node = Node.find(params[:id])

    render :json => @node
  end

  def create
    klass = Node.of_type(params[:kind])
    error = klass.validate(params)

    if error
      render :json => { error: error }, :status => 422
    else
      @node = klass.create(:value => params[:value])
      render :json => @node, :status => :created
    end
  end
end

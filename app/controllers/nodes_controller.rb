class NodesController < ApplicationController
  def show
    @node = Node.find(params[:id])

    render :json => @node
  end

  def evaluate
    @invoke = Invoke.find(params[:id])

    render :json => { result: @invoke.evaluate }
  end

  def create
    klass = Node.of_type(params[:kind])
    error = klass.validate(params)

    if error
      render :json => { error: error }, :status => 422
    else
      @node = klass.create(params.slice(:value, :function, :arguments))
      render :json => @node, :status => :created
    end
  end
end

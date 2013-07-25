class NodesController < ApplicationController
  def show
    @node = Node.find(params[:id])

    render :json => @node
  end

  def evaluate
    @node = Node.find(params[:id])

    p params
    $stdout.flush

    result = timeout(5) { @node.evaluate(nil) }

    render :json => { result: result }
  end

  def create
    klass = Node.of_type(params[:kind])
    error = klass.validate(params)

    if error
      render :json => { error: error }, :status => 422
    else
      args = params.slice(:value, :function, :arguments, :predicate, :true_branch, :false_branch, :argument)
      @node = klass.create(args)
      render :json => @node, :status => :created
    end
  end
end

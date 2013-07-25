class FunctionsController < ApplicationController
  def show
    @function = Function.find_by_name!(params[:id])

    render :json => @function
  end

  def create
    @function = Function.create(params.slice(:body))

    render :json => @function, :status => :created
  end

  def update
    @function = Function.find(params[:id])
    @function.update_attributes(params.slice(:body))

    render :json => @function, :status => :created
  end
end

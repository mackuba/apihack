class NodesController < ApplicationController
  def show
    @constant = Constant.find(params[:id])

    render :json => @constant
  end

  def create
    value = params[:value]

    if value.is_a?(Integer)
      @constant = Constant.create(:value => params[:value])

      render :json => @constant, :status => :created
    else
      render :json => { error: 'Could not parse integer' }, :status => 422
    end
  end
end

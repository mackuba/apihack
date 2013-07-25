class FunctionsController < ApplicationController
  def show
    @function = Function.find_by_name!(params[:id])

    render :json => @function
  end
end

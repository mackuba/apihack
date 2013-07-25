class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  protect_from_forgery

  def not_found
    head :not_found
  end
end

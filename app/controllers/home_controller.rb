class HomeController < ApplicationController
  def index
    
  end
  def api
    Rails.logger.debug params.inspect
    render :plain => 'success', :status => 200
  end
end
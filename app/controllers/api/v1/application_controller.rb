class Api::V1::ApplicationController < ActionController::Base
  
  private
  
  def render_json(success, message, status)
    render :json => {:success => success, :response => message}, :status => status
  end

end
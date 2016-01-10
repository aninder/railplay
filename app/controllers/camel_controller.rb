class CamelController < ActionController::Base
  def show
    render :json =>  Camel.find(params[:id])
  end
end
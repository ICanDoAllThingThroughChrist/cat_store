class Subscriber::BoxesController < Subscriber::ApplicationController
  before_action :authenticate, :only => [:new, :create]

  def index
    @boxes = Box.all
  end

  def show
    @box = Box.find(params[:id])
  end 



 
end

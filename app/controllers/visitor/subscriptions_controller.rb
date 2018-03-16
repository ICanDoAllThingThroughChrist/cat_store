class Visitor::SubscriptionsController < Visitor::ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def show
    binding.pry
    @subscription = Subscription.find(params[:id])
  end

  def new
    @subscription = Subscription.new
  end

  def create
    binding.pry
        if @subscription.save 
          flash[:notice] = "subscription has been created."
          redirect_to @subscription 
        else
          flash[:alert] = "subscription has not been created."
          render "new"
        end 
  end
end

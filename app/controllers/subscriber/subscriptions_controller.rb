class Subscriber::SubscriptionsController < Subscriber::ApplicationController
  def index
    @subscriptions = Subscription.all
  end

  def show
    @subscription = Subscription.find(params[:id])
  end

  def delete
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    flash[:notice] = "subscription has been deleted."
    redirect_to subscriptions_path
  end

  #   def subscription_params
  #     params.require(:subscription).permit(:level,:description, :rate, :id)
  # end
end

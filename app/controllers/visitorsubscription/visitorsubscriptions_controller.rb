class VisitorsubscriptionsController < ApplicationController
        def index
          @visitor_subscriptions= Visitorsubscription.all 
        end
      
        def show
          @visitor_subscription= Visitorsubscription.find(params[:id])
        end
      
        def new
          @new_visitor_subscription = Visitorsubscription.new
        end
      
        def create
          binding.pry
          @visitor_subscription = Visitorsubscription.create(visitor_subscription_params)
        end
      
        def edit
          
        end
      
        def update
        end
      
        def destroy
        end
      
end

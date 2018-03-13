require 'rails_helper'

RSpec.describe Admin::BoxesController, type: :controller do

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #manual_ship" do
    it "returns http success" do
      get :manual_ship
      expect(response).to have_http_status(:success)
    end
  end

end

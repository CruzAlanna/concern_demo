require 'rails_helper'

RSpec.describe "Orders API", type: :request do
  describe "GET /orders" do
    it "returns all orders" do
      create_list(:order, 3)
      get "/orders"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data.size).to eq(3)
    end
  end

  describe "GET /orders/:id" do
    it "returns the specified order" do
      order = create(:order, item_name: "Computer")
      get "/orders/#{order.id}"

      expect(response).to have_http_status(:ok)
      data = JSON.parse(response.body)
      expect(data["item_name"]).to eq("Computer")
    end
  end
end

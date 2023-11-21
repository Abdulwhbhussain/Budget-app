require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/home/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/home/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/home/create"
      expect(response).to have_http_status(:success)
    end
  end

end

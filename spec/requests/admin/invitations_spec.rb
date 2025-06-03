require 'rails_helper'

RSpec.describe "Admin::Invitations", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/admin/invitations/new"
      expect(response).to have_http_status(:found)
    end
  end
end

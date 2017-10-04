require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
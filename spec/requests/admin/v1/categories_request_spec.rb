require 'rails_helper'

RSpec.describe "Admin::V1::Categories", type: :request do
  # o let permite criar variáveis dentro do rspec
  let(:user) { create(:user) }

  context "GET /categories" do
    let(:url) { "/admin/v1/categories" }
    # O let! roda antes no banco de dados.
    # Quando eu chamar o endpoint eu quero que já exista no banco de dados de test as 5 categorias.
    let!(:categories) { create_list(:category, 5) }

    it "returns all Categories" do
      get url, headers: auth_header(user)
      expect(body_json['categories']).to contain_exactly *categories.as_json(only: %i(id name))
    end

    it "returns success status" do
      get url, headers: auth_header(user)
      expect(response).to have_http_status(:ok)
    end
  end
end

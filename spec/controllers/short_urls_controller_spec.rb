require 'rails_helper'

RSpec.describe ShortUrlsController, type: :controller do

  let(:original_url) { "https://www.google.com" }
  describe "GET #show" do
    it "redirects to the original url" do
      short_url = ShortUrl.create_for_url original_url
      get :show, params: {code: short_url.code}
      expect(response).to redirect_to(original_url)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ShortUrl" do
        expect {
          post :create, xhr: true, params: {original_url: original_url}
        }.to change(ShortUrl, :count).by(1)
      end

      it "assigns the full short url to the variable" do
        post :create, xhr: true, params: {original_url: original_url}
        expect(assigns(:full_short_url)).to eq ShortUrl.last.full_short_url
      end
    end
  end

end

require 'rails_helper'

RSpec.describe ShortUrl, type: :model do

  let(:original_url){ "https://www.google.com" }
  let(:mocked_code){ instance_double(String) }
  describe ".create_for_url" do

    it "creates a short url with the original url" do
      allow(SecureRandom).to receive(:urlsafe_base64).and_return(mocked_code)
      expect(ShortUrl).to receive(:create).with(original_url: original_url, code: mocked_code)
      ShortUrl.create_for_url original_url
    end

    it "creates a short url with a random code" do
      expect(SecureRandom).to receive(:urlsafe_base64).with(5)
      allow(ShortUrl).to receive(:create)
      ShortUrl.create_for_url original_url
    end
  end

  describe "#full_short_url" do
    it "joins the server host with the code" do
      short_url = ShortUrl.create_for_url original_url
      expect(SERVER_HOST).to receive(:+).with(short_url.code)
      short_url.full_short_url
    end
  end
end

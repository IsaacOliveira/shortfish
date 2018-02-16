require 'rails_helper'

RSpec.describe GetOriginalUrl, type: :model do

  let(:code){ instance_double(String) }
  let(:mock_short_url){ instance_double(ShortUrl) }

  describe "#execute" do
    subject{ GetOriginalUrl.new(code: code)}
    it "gets the short url by code" do
      expect(ShortUrl).to receive(:find_by).with(code: code).and_return(mock_short_url)
      allow(mock_short_url).to receive(:original_url)
      subject.execute
    end

    it "returns the original url" do
      allow(ShortUrl).to receive(:find_by).with(code: code).and_return(mock_short_url)
      expect(mock_short_url).to receive(:original_url)
      subject.execute
    end
  end
end

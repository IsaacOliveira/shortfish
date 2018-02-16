require 'rails_helper'

RSpec.describe CreateShortUrl, type: :model do

  let(:original_url){ "https://www.google.com" }

  describe "#execute" do
    subject{ CreateShortUrl.new(original_url: original_url)}
    it "calls short url creation method" do
      expect(ShortUrl).to receive(:create_for_url).with(original_url)
      subject.execute
    end

    it "returns the complete shortened url" do
      expect(subject.execute).to be == ShortUrl.last
    end
  end
end

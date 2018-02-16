class ShortUrl < ApplicationRecord

  def self.create_for_url(url)
    ShortUrl.create(original_url: url, code: generate_code)
  end

  def full_short_url
    SERVER_HOST + self.code
  end

  private
  def self.generate_code
    SecureRandom.urlsafe_base64(5)
  end
end

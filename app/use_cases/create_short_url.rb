class CreateShortUrl

  def initialize(original_url:)
    @original_url = original_url
  end

  def execute
    ShortUrl.create_for_url(@original_url)
  end
end
class GetOriginalUrl

  def initialize(code:)
    @code = code
  end

  def execute
    ShortUrl.find_by(code: @code).original_url
  end
end
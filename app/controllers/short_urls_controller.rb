class ShortUrlsController < ApplicationController

  def show
    url = GetOriginalUrl.new(code: params[:code]).execute
    redirect_to url
  end


  def create
    short_url = CreateShortUrl.new(original_url: params[:original_url]).execute
    @full_short_url = short_url.full_short_url
  end

end

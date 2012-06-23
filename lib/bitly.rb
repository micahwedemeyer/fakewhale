module Bitly
  require "open-uri"

  # Shortens a URL via bitly
  def shorten(url)
    bitly_url = "http://api.bit.ly/shorten?version=2.0.1&login=#{BITLY_LOGIN}&apiKey=#{BITLY_API_KEY}&longUrl=#{CGI::escape(url)}"
    resp = open(bitly_url).read
    JSON.parse(resp)['results'][url]['shortUrl']
  end
end


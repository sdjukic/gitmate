
require 'net/http'
require 'uri'

class Zen
  def initialize
    @zen_uri = URI.parse("https://api.github.com/zen")
  end

  def message
    response = Net::HTTP.get_response(@zen_uri)
    "\e[32m #{response.body} \e[0m"
  end
end

#!/usr/bin/ruby -w

require 'net/http'
require 'uri'

zen_uri = URI.parse("https://api.github.com/zen")
response = Net::HTTP.get_response(zen_uri)
puts "\e[32m #{response.body} \e[0m"

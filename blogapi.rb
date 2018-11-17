require 'net/http'
require 'uri'

url = 'http://localhost:3000/events'
uri = URI.parse(url)

params = { 'message' => 'yes' }

Net::HTTP.post_form(uri, params)
require 'net/http'
class DeroRpcController < ApplicationController
  attr_reader :url,
    :payload,
    :username,
    :password

  def initialize(
    url,
    method,
    params = [],
    username = nil,
    password = nil
  )
    @url = url
    @payload = {
      jsonrpc: '2.0',
      id: 1,
      method: method,
      params: params
    }
    @username = username
    @password = password
  end

  def send_request
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request['Content-Type'] = 'application/json'

    if username && password
      request.basic_auth(
        username,
        password
      )
    end

    request.body = payload.to_json

    response = http.request(request)
    JSON.parse(response.body)
  end
end

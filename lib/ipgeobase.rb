#require 'ipgeobase/version'
require 'net/http'
require 'json'
require 'uri'
require_relative './ipgeobase/metadata'

 module Ipgeobase
  class Error < StandardError; end

  def self.lookup(ip_address)
    validate_ip(ip_address)
    response = fetch_metadata(ip_address)
    parse_response(response)
  end

  def self.validate_ip(ip)
    pattern = /\A(\d{1,3}\.){3}\d{1,3}\z/
    raise Error, "Invalid IP address format" unless ip.match?(pattern)
  end

  def self.fetch_metadata(ip)
    uri = URI.parse("http://ip-api.com/json/#{ip}")
    response = Net::HTTP.get_response(uri)
    raise Error, "API request failed" unless response.is_a?(Net::HTTPSuccess)
    JSON.parse(response.body)
  end

  def self.parse_response(data)
    raise Error, data['message'] if data['status'] == 'fail'
    Metadata.new(data)
  end
end
  # Your code goes here...

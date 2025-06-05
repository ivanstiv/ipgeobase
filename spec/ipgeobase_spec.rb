require 'spec_helper'
require 'webmock/rspec'
require_relative '../lib/ipgeobase'
class IpgeobaseTest < Minitest::Test

require 'minitest/autorun'
# Другие ваши настройки...

  def test_lookup
    stub_request(:get, "http://ip-api.com/json/8.8.8.8")
      .to_return(body: {
        city: "Ashburn",
        country: "United States",
        countryCode: "US",
        lat: 39.03,
        lon: -77.5
      }.to_json)

    meta = Ipgeobase.lookup('8.8.8.8')
    assert{(meta.city)=="Ashburn"}
    assert{(meta.country)=="United States"}
    assert{(meta.country_code)==("US")}
    assert{(meta.lat)==(39.03)}
    assert{(meta.lon)==(-77.5)}
   end
end

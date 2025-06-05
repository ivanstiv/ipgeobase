module Ipgeobase
  class Metadata
    attr_reader :city, :country, :country_code, :lat, :lon

    def initialize(data)
      @city = data['city'] || data[:city]
      @country = data['country'] || data[:country]
      @country_code = data['countryCode'] || data[:country_code]
      @lat = data['lat'].to_f rescue 0.0
      @lon = data['lon'].to_f rescue 0.0
    end
  end
end
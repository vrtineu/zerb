# frozen_string_literal: true

require 'rgeo/geo_json'
require 'json'

file = File.read('pdvs.json')
data_hash = JSON.parse(file)

data_hash['pdvs'].each do |pdv|
  puts "inserting #{pdv['id']} - #{pdv['tradingName']}"

  coverage_area = RGeo::GeoJSON.decode(pdv['coverageArea'], json_parser: :json)
  address = RGeo::GeoJSON.decode(pdv['address'], json_parser: :json)

  Partner.create(
    id: pdv['id'],
    trading_name: pdv['tradingName'],
    owner_name: pdv['ownerName'],
    document: pdv['document'],
    coverage_area:,
    address:
  )
end

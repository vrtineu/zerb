# frozen_string_literal: true

json.partners do
  json.array! @partners do |partner|
    json.extract! partner, :id, :trading_name, :owner_name, :document
    json.coverage_area RGeo::GeoJSON.encode(partner.coverage_area)
    json.address RGeo::GeoJSON.encode(partner.address)
  end
end

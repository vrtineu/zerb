# frozen_string_literal: true

json.type "FeatureCollection"
json.features do
  json.array!(@partners) do |partner|
    json.type "Feature"
    json.properties do
      json.id partner.id
      json.trading_name partner.trading_name
      json.owner_name partner.owner_name
      json.document partner.document
      json.address RGeo::GeoJSON.encode(partner.address)
    end
    json.geometry do
      json.type "Polygon"
      json.coordinates *RGeo::GeoJSON.encode(partner.coverage_area)["coordinates"]
    end
  end

  json.array!(@partners) do |partner|
    json.type "Feature"
    json.properties do
      json.id partner.id
      json.trading_name partner.trading_name
      json.owner_name partner.owner_name
      json.document partner.document
    end
    json.geometry do
      json.type "Point"
      json.coordinates RGeo::GeoJSON.encode(partner.address)["coordinates"]
    end
  end
end

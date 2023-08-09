# frozen_string_literal: true

RGeo::ActiveRecord::SpatialFactoryStore.instance.tap do |config|
  config.default = RGeo::Geos.factory

  # register multi_polygon factory for coverage_area
  config.register(RGeo::Geographic.spherical_factory(srid: 4326), geo_type: 'multi_polygon')
  # register point factory for address
  config.register(RGeo::Geographic.spherical_factory(srid: 4326), geo_type: 'point')
end

# frozen_string_literal: true

class Partner < ActiveRecord::Base
  validates :trading_name, :owner_name, :document, :coverage_area, :address, presence: true
  validates :document, uniqueness: true

  def self.find_nearest(lat, long)
    point = RGeo::Geographic.spherical_factory(srid: 4326).point(long, lat)
    partner = Partner.arel_table
    Partner.order(partner[:coverage_area].st_distance(point)).order(partner[:address].st_distance(point)).first
  end
end

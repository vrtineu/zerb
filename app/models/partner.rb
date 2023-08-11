# frozen_string_literal: true

class Partner < ActiveRecord::Base
  validates :trading_name, :owner_name, :document, :coverage_area, :address, presence: true
  validates :document, uniqueness: true

  def self.find_nearest(long,lat)
    closest_partner = Partner
      .select(Arel.star)
      .where(
        Partner.arel_table[:coverage_area].st_intersects(
          Arel.spatial("SRID=4326;POINT(#{long} #{lat})")
        )
      )
      .order(
        Partner.arel_table[:address].st_distance(
          Arel.spatial("SRID=4326;POINT(#{long} #{lat})")
        )
      )
      .first

    closest_partner
  end
end

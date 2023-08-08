# frozen_string_literal: true

class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :trading_name
      t.string :owner_name
      t.string :document
      t.multi_polygon :coverage_area, srid: 4326
      t.point :address, geographic: true

      t.timestamps
    end
  end
end

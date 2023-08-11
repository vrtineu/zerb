# frozen_string_literal: true

class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :trading_name
      t.string :owner_name
      t.string :document
      t.geometry :coverage_area, :multi_polygon, srid: 4326
      t.geometry :address, :point, srid: 4326

      t.timestamps
    end
  end
end

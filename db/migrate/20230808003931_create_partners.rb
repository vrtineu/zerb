# frozen_string_literal: true

class CreatePartners < ActiveRecord::Migration[7.0]
  def change
    create_table :partners do |t|
      t.string :trading_name
      t.string :owner_name
      t.string :document
      t.geography :address, limit: { srid: 4326, type: 'point', geographic: true }, null: false
      t.geography :coverage_area, limit: { srid: 4326, type: 'multi_polygon', geographic: true }, null: false

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class Partner < ApplicationRecord
  attribute :coverage_area, :multi_polygon
  attribute :address, :point
  attribute :document, :string
  attribute :owner_name, :string
  attribute :trading_name, :string

  validates :coverage_area, presence: true
  validates :address, presence: true
  validates :document, presence: true, uniqueness: true
  validates :owner_name, presence: true
  validates :trading_name, presence: true, uniqueness: true
end

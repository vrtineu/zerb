# frozen_string_literal: true

class Partner < ActiveRecord::Base
  validates :trading_name, :owner_name, :document, :coverage_area, :address, presence: true
  validates :document, uniqueness: true
end

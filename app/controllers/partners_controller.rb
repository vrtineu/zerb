# frozen_string_literal: true

class PartnersController < ApplicationController
  before_action :load_all_partners, only: %i[index geojson]

  def index; end
  def geojson; end

  def show
    @partner = Partner.find(params[:id])
  rescue StandardError
    render json: { message: 'Partner not found' }, status: :not_found
  end

  def create
    @partner = Partner.new
    @partner.attributes = partner_params
  end

  def nearest
    @partner = Partner.find_nearest(params[:lng], params[:lat])
    puts @partner
    render :show
  rescue StandardError
    render json: { message: 'Partner not found' }, status: :not_found
  end

  private

  def load_all_partners
    @partners = Partner.all
  end

  def partner_params
    return {} unless params.key?(:partner)

    params.require(:partner).permit(:trading_name, :owner_name, :document, :coverage_area, :address)
  end

  def save_partner!
    @partner.save!
  rescue StandardError
    raise ActiveRecord::RecordInvalid, @partner
  end
end

# frozen_string_literal: true

require 'rest-client'

class MenuImporter
  BASE_URL = 'https://api.lightspeed.com'

  def initialize; end

  def call; end

  private

  def products
    ::RestClient::Request.execute(
      method: :get, url: "#{BASE_URL}/inventory/product", headers: {}, payload: nil
    ).body
  end

  def product_groups
    ::RestClient::Request.execute(
      method: :get, url: "#{BASE_URL}/inventory/productgroup", headers: {}, payload: nil
    ).body
  end
end

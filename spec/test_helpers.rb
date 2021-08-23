# frozen_string_literal: true

module TestHelpers
  def fixture_file(path)
    File.read "#{Rails.root}/spec/fixtures/#{path}"
  end

  def json_fixture(path, symbolize_names: false)
    JSON.parse(fixture_file(path), symbolize_names: symbolize_names)
  end

  def stub_lightspeed_fetch
    stub_url('inventory/product', fixture: 'lightspeed/products.json')
    stub_url('inventory/productgroup', fixture: 'lightspeed/product_groups.json')
  end

  def stub_ikentoo_fetch
    stub_url('menu', fixture: 'ikentoo/menu.json')
  end

  private

  def stub_url(url, method: :get, headers: anything, payload: nil, fixture: nil)
    response = ::RestClient::Response.new
    allow(response).to receive(:body).and_return(fixture_file(fixture))
    allow(::RestClient::Request)
      .to receive(:execute)
      .with(url: a_string_including(url), headers: headers, method: method, payload: payload)
      .and_return(response)
  end
end

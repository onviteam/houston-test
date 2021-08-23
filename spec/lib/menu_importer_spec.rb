# frozen_string_literal: true

require 'rails_helper'
require 'menu_importer'

RSpec.describe MenuImporter do
  before do
    stub_lightspeed_fetch
  end

  subject { described_class.new.call }

  it 'seeds the menu data' do
    subject
  end
end

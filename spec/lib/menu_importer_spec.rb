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

  it 'creates the expected number of Categories' do
    expect { subject }.to change(Category, :count).by(3)
  end

  it 'creates the expected number of Items' do
    expect { subject }.to change(Item, :count).by(2)
  end

  it 'creates the expected number of Portions' do
    expect { subject }.to change(Portion, :count).by(6)
  end

  context 'when verifying the seeding of the data' do
    before { subject }

    context 'for Category #62732' do
      let(:category) { Category.find_by(external_id: 62_732) }
      let(:parent_category) { Category.find_by(external_id: 62_753) }

      it 'creates with the expected data' do
        expect(category&.name).to eq('Savoury Crepes')
        expect(category&.parent).to eq(parent_category)
      end
    end

    context 'for Item #157879' do
      let(:item) { Item.find_by(external_id: 157_879) }

      it 'creates with the expected data' do
        expect(item&.name).to eq('Base Crepe')
        expect(item&.portions&.length).to eq(3)
        expect(item&.categories&.length).to eq(2)
      end

      it 'seeds the portions as expected' do
        portions = item&.portions
        expect(portions&.map(&:price)).to eq([12_995, 350, 450])
      end
    end

    context 'for Item #157880' do
      let(:item) { Item.find_by(external_id: 157_880) }

      it 'creates with the expected data' do
        expect(item&.name).to eq('Fancy Crepe')
        expect(item&.portions&.length).to eq(3)
        expect(item&.categories&.length).to eq(1)
      end

      it 'seeds the portions as expected' do
        portions = item&.portions
        expect(portions&.map(&:price)).to eq([101, 101, 101])
      end
    end
  end
end

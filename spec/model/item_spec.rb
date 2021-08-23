# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many :portions }
  it { should have_many :category_items }
  it { should have_many :categories }
end

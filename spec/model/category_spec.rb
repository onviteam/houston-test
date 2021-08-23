# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :items }
end
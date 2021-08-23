# frozen_string_literal: true

require 'rails_helper'
# frozen_string_literal: true

RSpec.describe Portion, type: :model do
  it { should belong_to :item }
end

# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    sequence(:name) { |i| "Item #{i}" }
    sequence(:external_id) { |i| 1000 + i }
  end

  factory :portion do
    sequence(:name) { |i| "Portion #{i}" }
    sequence(:external_id) { |i| 1000 + i }
    price { rand(1...1000) }
    item
  end
end

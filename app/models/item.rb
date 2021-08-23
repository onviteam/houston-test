# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :portions

  has_many :category_items
  has_many :categories, through: :category_items
end

# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :category_items
  has_many :items, through: :category_items

  belongs_to :parent, class_name: 'Category', required: false
end

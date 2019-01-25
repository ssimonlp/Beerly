# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :beers, dependent: :destroy
  has_many :styles, dependent: :destroy
end

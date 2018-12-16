# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :beers
  has_many :styles
end

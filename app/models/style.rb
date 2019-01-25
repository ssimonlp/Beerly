# frozen_string_literal: true

class Style < ApplicationRecord
  belongs_to :category
  has_many :beers, dependent: :destroy
end

class Coin < ApplicationRecord
  validates :name, :value, :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end

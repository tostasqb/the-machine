class Product < ApplicationRecord
  validates :name, :price, :quantity, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  def self.available
    where('quantity > ?', 0)
  end


  def self.not_available
    where('quantity <= ?', 0)
  end
end

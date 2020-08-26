require 'rails_helper'
require "#{Rails.root}/lib/vending"

RSpec.describe Vending do
  let(:valid_product) { create(:product) }
  let(:no_stock) { create(:product, :no_stock) }
  let(:quantity_one) { build(:product, :quantity_one) }
  let(:product_one_pound) { create(:product, :product_one_pound) }
  let(:pound) { create(:coin, :pound) }

  it 'Is valid when product is available' do
    result = described_class.return_product(valid_product.id)
    expect(result).to eq(true)
  end

  it 'Is not valid when product is unavailable' do
    expect { described_class.return_product(no_stock.id) }.to raise_error
  end


  it 'Is expected to have a change of 1 pound if I pay 2 pounds' do
    c = create(:coin, :pound)
    coins_inserted = [2]
    result = described_class.calculate_change(coins_inserted, product_one_pound.id)

    expect(result).to eq([1.0])
  end
end

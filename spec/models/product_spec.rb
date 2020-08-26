require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:valid_product) { create(:product) }
  let(:negative) { build(:product, :negative) }
  let(:quantity_one) { build(:product, :quantity_one) }

  it 'is valid when parameters are correct' do
    expect(valid_product).to be_valid
  end

  it 'is valid when quantity = 1' do
    expect(quantity_one).to be_valid
  end

  it 'is not valid when quantity < 0' do
    expect(negative).not_to be_valid
  end
end

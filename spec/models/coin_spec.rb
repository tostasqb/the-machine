require 'rails_helper'

RSpec.describe Coin, type: :model do
  let(:valid_coin) { create(:coin) }
  let(:negative) { build(:coin, :negative) }
  let(:just_one) { build(:coin, :just_one) }


  it 'is valid when parameters are correct' do
    expect(valid_coin).to be_valid
  end

  it 'is not valid when quantity < 0' do
    expect(negative).not_to be_valid
  end

  it 'is valid when quantity is 1' do
    expect(just_one).to be_valid
  end
end

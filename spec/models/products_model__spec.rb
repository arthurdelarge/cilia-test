require 'rails_helper'

MIN_PRICE = 0
MAX_PRICE = 1_000_000

describe Products do
  
  context 'associations' do
    it { should have_many(:sale_products) }
    it { should have_many(:sales).through(:sale_products) }
  end

  context 'validations' do
    context 'presence' do
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:price) }
    end

    context 'name' do
      it { should allow_value('Arthur').for(:description) }
      it { should_not allow_value('0').for(:description) }
      it { should_not allow_value('').for(:description) }
      it { should allow_value('Nome').for(:description) }
      it { should validate_length_of(:description).is_at_most(255) }
      it { should validate_length_of(:description).is_at_least(4) }
    end

    context 'description' do
    end

    context 'price' do
      it { should_not allow_value(MIN_PRICE).for(:price) }
      it { should_not allow_value(MAX_PRICE).for(:price) }
      it { should validate_numericality_of(:price).is_greater_than(MIN_PRICE) }
      it { should validate_numericality_of(:price).is_less_than(MAX_PRICE)}
      it { should allow_value(13).for(:price) }
      it { should allow_value(13.4).for(:price) }
      it { should allow_value(13.45).for(:price) }
      it { should_not allow_value(13.456).for(:price) }
    end

    context 'image' do
    end
  end
end
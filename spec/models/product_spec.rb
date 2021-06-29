require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "name validation" do
      @category = Category.new(name: "fruit")
      @product = Product.new(price: 2, quantity: 4, category: @category)
      expect(@product.valid?).to eql(false)
      expect(@product.errors.full_messages).to eql(["Name can't be blank"])
    end

    it "price validation" do
      @category = Category.new(name: "fruit")
      @product = Product.new(name: 'apple', quantity: 4, category: @category)
      expect(@product.valid?).to eql(false)
      expect(@product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it "quantity validation" do
      @category = Category.new(name: "fruit")
      @product = Product.new(name: 'apple', price: 2, category: @category)
      expect(@product.valid?).to eql(false)
      expect(@product.errors.full_messages).to eql(["Quantity can't be blank"])
    end

    it "category validation" do
      @product = Product.new(name: 'apple', quantity: 4, price: 2)
      expect(@product.valid?).to eql(false)
      expect(@product.errors.full_messages).to eql(["Category can't be blank"])
    end
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'product is saved successfully' do
      category = Category.new(name: 'Electronics') 
      product = Product.new(name: "Carl", price_cents: 10, quantity: 5, category: category)
      
      expect(product).to be_valid
    end

    it 'validates presence of name' do
      category = Category.new(name: 'Electronics') 
      product = Product.new(name: nil, price_cents: 10, quantity: 5, category: category)
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'validates presence of price' do
      category = Category.new(name: 'Housewares') 
      product = Product.new(name: 'Teresa', price_cents: nil, quantity: 5, category: category)
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'validates presence of quantity' do
      category = Category.new(name: 'Electronics') # Assuming you have a Category model
      product = Product.new(name: 'Teresa', price_cents: 10, quantity: nil, category: category)
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'validates presence of name' do
      category = Category.new(name: 'Electronics') # Assuming you have a Category model
      product = Product.new(name: 'Teresa', price_cents: 10, quantity: 5, category: nil)
      
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
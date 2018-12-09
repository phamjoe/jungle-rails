require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should return successful given all four fields' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = cat1.products.create!({
        name:  'Men\'s Classy shirt',
        quantity: 10,
        price: 64.99
      })

      expect(@product.id).to be_present
    end  

    it 'should pass when product has no name' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = cat1.products.create({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      puts '-------------Test 1 - Name test ------------------'
      puts @product.errors.full_messages
      puts '--------------------------------------------------'
      expect(@product.name).to be_nil
    end  

    it 'should pass when product has no quantity' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = cat1.products.create({
        name:  'Shirt',
        quantity: nil,
        price: 64.99
      })
      puts '-------------Test 2 - Quantity test --------------'
      puts @product.errors.full_messages
      puts '--------------------------------------------------'
      expect(@product.quantity).to be_nil
    end  

    it 'should pass when product has no price' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = cat1.products.create({
        name:  'Shirt',
        quantity: 10,
        price: nil
      })
      puts '-------------Test 3 - Price test -----------------'
      puts @product.errors.full_messages
      puts '--------------------------------------------------'
      expect(@product.price).to be_nil
    end  

    it 'should pass when product has category' do
      cat1 = Category.find_or_create_by! name: 'Apparel'
      @product = cat1.products.create({
        name:  'Shirt',
        quantity: 10,
        price: 64.99,
       
      })

      expect(@product.category).to be_present
    end  


  end
end
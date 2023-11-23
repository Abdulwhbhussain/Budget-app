require 'rails_helper'

RSpec.describe Category, type: :model do
  user = User.create!(email: 'ali@gmail.com', password: 'password', password_confirmation: 'password', name: 'ali')

  deal = Deal.create!(name: 'Food', amount: 100, author: user)

  category = Category.create!(name: 'Chicken', icon: 'fas fa-drumstick-bite', author: user, deals: [deal])

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category.icon = nil
    expect(category).to_not be_valid
  end

  it 'is not valid without an author' do
    category.author = nil
    expect(category).to_not be_valid
  end

  it 'belongs to an author' do
    expect(deal).to respond_to(:author)
  end

  it 'has and belongs to many categories' do
    expect(category).to respond_to(:deals)
  end
end

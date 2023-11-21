require 'rails_helper'

RSpec.describe Deal, type: :model do
  user = User.create!(email: 'ismael@gmail.com', password: 'password', password_confirmation: 'password',
                      name: 'ismael')

  category = Category.create!(name: 'Transport', icon: 'car', author: user)

  deal = Deal.create!(name: 'Car', amount: 100, author: user, categories: [category])

  it 'is valid with valid attributes' do
    expect(deal).to be_valid
  end

  it 'is not valid without a name' do
    deal.name = nil
    expect(deal).to_not be_valid
  end

  it 'is not valid without an amount' do
    deal.amount = nil
    expect(deal).to_not be_valid
  end

  it 'is not valid with an amount less than 0' do
    deal.amount = -1
    expect(deal).to_not be_valid
  end

  it 'belongs to an author' do
    expect(deal).to respond_to(:author)
  end

  it 'has and belongs to many categories' do
    expect(deal).to respond_to(:categories)
  end
end

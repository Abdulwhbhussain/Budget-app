require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(email: 'example@ex.com', password: '123456', password_confirmation: '123456', name: 'Example')
  end

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'has many deals' do
    expect(subject).to respond_to(:deals)
  end

  it 'has many categories' do
    expect(subject).to respond_to(:categories)
  end
end

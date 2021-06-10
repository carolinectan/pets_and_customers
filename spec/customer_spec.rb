require 'rspec'
require './lib/pet'
require './lib/customer'

RSpec.describe Customer do
  before :each do
    @joel = Customer.new('Joel', 2)
  end

  it 'exists' do
    expect(@joel).to be_a(Customer)
  end

  it 'initializes with attributes' do
    expect(@joel.name).to eq('Joel')
    expect(@joel.id).to eq(2)
    expect(@joel.pets).to eq([])
  end

  it 'can adopt pets' do
    @samson = Pet.new({name: 'Samson', type: :dog, age: 3})
    @lucy = Pet.new({name: 'Lucy', type: :cat, age: 12})

    @joel.adopt(@samson)
    @joel.adopt(@lucy)

    expect(@joel.pets).to eq([@samson, @lucy])
  end

  it 'can return customer's outstanding balance' do
    expect(@joel.outstanding_balance).to eq(0)

    @joel.charge(15)
    @joel.charge(7)

    expect(@joel.outstanding_balance).to eq(22)
  end
end

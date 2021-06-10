require 'rspec'
require './lib/pet'
require './lib/customer'
require './lib/daycare'

RSpec.describe Daycare do
  before :each do
    @leia = Pet.new({name: 'Leia', type: :dog, age: 4})
    @megan = Customer.new('Megan', 5462)
    @megan.adopt(@leia)

    @bosco = Pet.new({name: 'Bosco', type: :dog, age: 8})
    @joni = Customer.new('Joni', 9486)
    @joni.adopt(@bosco)

    @jack = Pet.new({name: 'Jack', type: :dog, age: 2})
    @potato = Pet.new({name: 'Potato', type: :dog, age: 7})
    @john = Customer.new('John', 3249)
    @john.adopt(@jack)
    @john.adopt(@potato)

    @daycare1 = Daycare.new('Dog Haven', [@megan])
    @daycare2 = Daycare.new('Adventure Dogs', [@joni, @john])
  end

  it 'exists' do
    expect(@daycare1).to be_a(Daycare)
    expect(@daycare2).to be_a(Daycare)
  end

  it 'initializes with attributes' do
    expect(@daycare1.name).to eq('Dog Haven')
    expect(@daycare1.customers).to eq([@megan])
    expect(@daycare2.name).to eq('Adventure Dogs')
    expect(@daycare2.customers).to eq([@joni, @john])
  end

  it 'can return all pets of a daycare' do
    expect(@daycare1.all_pets).to eq([@leia])
    expect(@daycare2.all_pets).to eq([@bosco, @jack, @potato])
  end

  it 'can return the pets of a customer' do
    expect(@daycare1.pets('Megan')).to eq([@leia])
    expect(@daycare1.pets('Joni')).to eq([@bosco])
    expect(@daycare1.pets('John')).to eq([@jack, @potato])
  end

  xit 'can find a customer by the customer id' do
    expect(@daycare1)
  end

  xit 'can return a list of all pets that are unfed' do

  end
end


# Iteration 3
# Each Day Care has multiple customers, and each of those customers can have multiple pets.
# A Day Care can find a customer by the customer's id
# A Day Care can list all pets that are unfed

# Iteration 4
# The day care company would like to be able to feed all of its unfed pets and charge customers for feeding their pets. Each day care has its own price that it charges to feed a pet, and this price should vary depending on what type of pet it is (dog, cat, etc.).

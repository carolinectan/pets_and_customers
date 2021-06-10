require 'rspec'
require './lib/pet'
require './lib/customer'
require './lib/groomer'

RSpec.describe Groomer do
  before :each do
    @megan = Customer.new("Megan", 5462)
    @leia = Pet.new({name: "Leia", type: :dog, age: 4})
    @megan.adopt(@leia)

    @joni = Customer.new("Joni", 9486)
    @bosco = Pet.new({name: "Bosco", type: :dog, age: 8})
    @joni.adopt(@bosco)

    @wagstoriches = Groomer.new("Wags to Riches", [@megan, @joni])

    @carey = Customer.new("Carey", 8459)
    @chicken = Pet.new({name: "Chicken", type: :cat, age: 10})
    @squirrel = Pet.new({name: "Squirrel", type: :cat, age: 7})
    @carey.adopt(@chicken)
    @carey.adopt(@squirrel)

    @john = Customer.new("John", 3249)
    @jack = Pet.new({name: "Jack", type: :dog, age: 2})
    @john.adopt(@jack)

    @scruffytofluffy = Groomer.new("Scruffy to Fluffy", [@carey, @john])
  end

  it "exists" do
    expect(@wagstoriches).to be_a(Groomer)
    expect(@scruffytofluffy).to be_a(Groomer)
  end

  it "initializes with attributes" do
    expect(@wagstoriches.name).to eq("Wags to Riches")
    expect(@wagstoriches.customers).to eq([@megan, @joni])

    expect(@scruffytofluffy.name).to eq("Scruffy to Fluffy")
    expect(@scruffytofluffy.customers).to eq([@carey, @john])
  end

  it "can return pets of each customer" do
    expect(@megan.pets).to eq([@leia])
    expect(@joni.pets).to eq([@bosco])
    expect(@carey.pets).to eq([@chicken, @squirrel])
    expect(@john.pets).to eq([@jack])
  end

  it "can determine customers with outstanding balances" do
    @joni.charge(30)

    expect(@megan.outstanding_balance).to eq(0)
    expect(@joni.outstanding_balance).to eq(30)
    expect(@wagstoriches.customers_with_outstanding_balances).to eq([@joni.name])

    @carey.charge(68)
    @john.charge(90)

    expect(@carey.outstanding_balance).to eq(68)
    expect(@john.outstanding_balance).to eq(90)
    expect(@scruffytofluffy.customers_with_outstanding_balances).to eq([@carey.name, @john.name])
  end

  it "can count the number of pets of a given type" do
    expect(@wagstoriches.count_pets_by_type(:dog)).to eq(2)
    expect(@wagstoriches.count_pets_by_type(:cat)).to eq(0)

    expect(@scruffytofluffy.count_pets_by_type(:dog)).to eq(1)
    expect(@scruffytofluffy.count_pets_by_type(:cat)).to eq(2)
  end
end

# Iteration 4:
# The pet grooming company would like to be able to track more information on charges.
# They want to be able to track what the charge was for, for example washing, hair cut, etc.
# They also want to know which customer the charge applies to, which pet the charge applies to,
# and the amount of the charge.

class Groomer
  attr_reader :name, :customers

  def initialize (name, customers)
    @name = name
    @customers = customers
  end

  def customers_with_outstanding_balances
    overdue = []

    @customers.each do |customer|
      if customer.outstanding_balance > 0
        overdue << customer.name
      end
    end

    overdue
  end

  def count_pets_by_type(type)
    count = 0
    require "pry"; binding.pry

    pets = @customers.map do |customer|
      customer.pets
    end.flatten

    pets.each do |pet|
      if pet.type == type
        count+=1
      end
    end
    count
  end
end

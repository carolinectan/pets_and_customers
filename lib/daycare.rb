class Daycare
  attr_reader :name, :customers

  def initialize(name, customers)
    @name = name
    @customers = customers
  end

  def all_pets
    @customers.flat_map do |customer|
      customer.pets
    end
  end

  # def pets(customer)
  #   customer.pets
  # end

  def pets(name)
    customer_array = @customers.select do |customer|
      customer.name == name
    end

    customer_array.flat_map do |customer|
      customer.pets
    end
    # require "pry"; binding.pry

  end
end

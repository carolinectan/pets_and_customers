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

  def pets(name)
    @customers.find do |customer|
      customer.name == name
    end.pets
  end

  def find_customer_by_id(id)
    @customers.find do |customer|
      customer.id == id
    end
  end
end

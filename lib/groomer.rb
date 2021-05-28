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
    type_count = 0

    @customers.select do |customer|
      customer.pets.select do |pet|
        if pet.type == :dog
          dog_count += 1
        elsif pet.type == :cat
          cat_count += 1
        end
      end
    end
  end
end

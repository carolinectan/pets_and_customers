class Customer
  attr_reader :name, :id, :pets, :outstanding_balance

  def initialize(name, id)
    @name = name
    @id = id
    @pets = []
    @outstanding_balance = 0
  end

  def adopt(new_pet)
    @pets << new_pet
  end

  def charge(amount)
    @outstanding_balance = @outstanding_balance + amount
  end
end

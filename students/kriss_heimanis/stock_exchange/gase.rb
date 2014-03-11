class Gase
  attr_accessor :clients

  def initialize
    @clients = {}
  end

  # def create_account(account_name, starting_balance)
  #   @accounts[account_name] = starting_balance
  # end

  # def deposit(account_name, amount)
  #   @accounts[account_name] += amount
  # end

  # def balance(account_name)
  #   @accounts[account_name] 
  # end

  # def withdraw(account_name, amount)
  #   @accounts[account_name] -= amount if amount <= self.balance(account_name)
  # end

end
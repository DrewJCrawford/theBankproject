class Customer
  attr_accessor :name, :location

  def initialize (name, location)
    @name = name
    @location = location
  end

end


class Account
  attr_reader :acct_num, :balance
  attr_accessor :customer, :acct_type

  def initialize (customer, balance, acct_num, acct_type)
    @customer = customer
    @balance = balance
    @acct_type = acct_type
    @acct_num = acct_num
  end
  def deposit
    puts "How much would you like to deposit?"
    print "$"
    amount = gets.chomp.to_f
    @balance += amount
    puts "Your new balance is $#{'%0.2f'%(@balance)}"
#formating opion '%0.2f'%
  end
  def withdrawl
    puts "How much would you like to withdrawl?"
    print "$"
    amount = gets.chomp.to_f
    if @balance < amount
      @balance -= (amount + 25)
      puts "You have encurred a $25 overdraft fee"
    else
      @balance -= amount
    end
    puts "Your new balance is $#{'%0.2f'%(@balance)}"
  end
end
#hello!

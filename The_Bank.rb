require_relative 'bank.classes'

@customers = []
@accounts = []

def welcome_screen
  @current_customer = ""

  puts "Welcom to The Bank"
  puts "Please choose from the following"
  puts "__________________________________"
  puts "1. Customer Sign-In"
  puts "2. New Customer Registration"

  choice = gets.chomp.to_i
  case choice
  when 1
    sign_in
  when 2
    sign_up("","")
  end
end

def sign_in
  puts "What is your name?"
  name = gets.chomp
  pring = "What is your location?"
  location = gets.chomp

  if @customers.empty?
    puts "No customer found with that information"
    sign_up(name, location)
  end
  customer_exists = false
  @customer.each do |customer|
    if name == customer.name && location == customer.loaction
      @current_customer
      customer_exists = true
    end
  end
  if customer_exists
    account_menu
  else
    puts "No customer found with that information"
    puts "1. Try again?"
    puts "2. Sign up"
    choice = gets.chomp.to_i
  end
  case choice
    when 1
      sign_in
    when 2
      sign_up(name, location)
  end
end

def sign_up(name, location)
  puts "Sign Up:"
  if name == "" && location == ""
    puts "What is your name?"
    name = gets.chomp
    puts "what is your location"
    location = gets.chomp
  @current_customer = Customer.new(name, location)
  @customers.push(@current_customer)
  puts "Registration Successful!"
  end
  account_menu
end
#@ variable = instance variable

def account_menu
  puts "Account Menu"
  puts "________________"
  puts "1. Create and Account"
  puts "2. Review an Account"
  puts "3. Sign Out"

  choice = gets.chomp.to_i

  case choice
  when 1
    create_account
  when 2
    review_account
  when 3
    puts "Thanks for banking with us."
    welcome_screen
  else
    puts "Invalid Selection"
    account_menu
  end

end

def create_account
  puts "How much will your first deposit be"
  amount = gets.chomp.to_f

  puts "What type of account would you like to open"
  acct_type = gets.chomp

  new_acct = Account.new(@current_customer, amount, (@accounts.length+1), acct_type)
  @accounts.push(new_acct)
  puts "Account created succesffully"
  account_menu
end

def review_account
  @current_account = ""
  @accounts.each do |x|
    puts "List of accounts #{x.acct_type} " if x.customer = @current_customer
  end
  puts "Which account (type) do you want to review?"
  type = gets.chomp.downcase

  account_exists = false
  @accounts.each do |account|
    if @account_customer = account.customer && type == account.acct_type.downcase
      @current_account = account
      account_exists = true
    end
  end
  if account_exists == true
    current_account_actions
  else
    puts "Try Again"
    review_account
  end
end

def current_account_actions
  puts "Choose from the following:"
  puts "______________________________"
  puts "1. Balance Check"
  puts "2. Make a Deposit"
  puts "3. Make a Withdrawl"
  puts "4. Return to Account Menu"
  puts "5. Sign Out"

  choice = gets.chomp.to_i
  case choice
  when 1
    puts "Current balance is $#{'%0.2f' % (@current_account.balance)}"
    current_account_actions
  when 2
    @current_account.deposit
    current_account_actions
  when 3
    @current_account.withdrawl
    current_account_actions
  when 4
    review_account
  when 5
    welcome_screen
  else
    puts "Invalid Selection"
    current_account_actions
  end
end

welcome_screen

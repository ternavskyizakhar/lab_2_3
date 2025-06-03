def create_user
  user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
   Account.create!(
    user: user,
    balance: Faker::Number.decimal(l_digits: 2).abs
  )
end

def create_account
  Account.create!(
    user: User.all.sample,
    balance: Faker::Number.decimal(l_digits: 2).abs
  )
end

def create_transaction
  account = Account.all.sample
  Transaction.create!(
    account: account,
    receiver: Account.where.not(id: account.id).sample,
    amount: Faker::Number.decimal(l_digits: 2).abs,
  )
end

20.times do
  create_user
  create_account
end

50.times do
  create_transaction
end

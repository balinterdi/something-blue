Factory.sequence :login do |n|
  "person#{n}"
end

Factory.sequence :email do |n|
  "person#{n}@example.com"
end

Factory.define :user do |user|
  user.login { |a| Factory.next :login }
  user.password "secret"
  user.password_confirmation "secret"
end

Factory.define :lending do |l|
end

Factory.define :user_session do |session|
  session.login "leonhard"
  session.password "secret"
end
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
  l.title "Letters from a stoic"
  l.time  "3"
  l.association :from, :factory => :user
  l.association :to, :factory => :user
end

Factory.define :user_session do |session|
  session.login "seneca"
  session.password "secret"
end
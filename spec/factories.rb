Factory.define(:user) do |user|
  user.login "balint"
  user.password "secret"
  user.password_confirmation "secret"
end

Factory.define(:lending) do |l|
end

Factory.define(:user_session) do |session|
  session.login "leonhard"
  session.password "secret"
end
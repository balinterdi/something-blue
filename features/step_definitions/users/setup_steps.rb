Given /^the user called "([^\"]*)" has the password "([^\"]*)"$/ do |login, password|
  user = User.by_login(login)
  user.password = password
  user.save
end
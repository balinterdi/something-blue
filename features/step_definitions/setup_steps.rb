Given /^there is a user called "([^\"]*)"$/ do |login|
  Factory(:user, :login => login)
end
Given /^there is a lending called "([^\"]*)"$/ do |title|
  Factory(:lending, :title => title)
end

Given /^the lending called "([^\"]*)" is lent by "([^\"]*)"$/ do |title, login|
  lending = Lending.by_title(title)
  user = User.by_login(login)
  lending.from = user
  lending.save
end

Given /^the lending called "([^\"]*)" is lent to "([^\"]*)"$/ do |title, login|
  lending = Lending.by_title(title)
  user = User.by_login(login)
  lending.to = user
  lending.save
end

Given /^the lending called "([^\"]*)" is for "([^\"]*)" days$/ do |title, num_days|
  lending = Lending.by_title(title)
  lending.time = num_days
  lending.save
end
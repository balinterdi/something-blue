When /^I fill in the login field with "([^\"]*)"$/ do |login|
  When %(I fill in "user_session[login]" with "#{login}")
end

When /^I fill in the password field with "([^\"]*)"$/ do |password|
  When %(I fill in "user_session[password]" with "#{password}")
end
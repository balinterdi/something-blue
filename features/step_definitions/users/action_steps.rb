When /^I fill in the user's login with "([^\"]*)"$/ do |login|
  When %(I fill in "user[login]" with "#{login}")
end

When /^I fill in the user's password with "([^\"]*)"$/ do |password|
  When %(I fill in "user[password]" with "#{password}")
end

When /^I fill in the user's password confirmation with "([^\"]*)"$/ do |password|
  When %(I fill in "user[password_confirmation]" with "#{password}")
end
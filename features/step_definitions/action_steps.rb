When /^I fill in the lending's title with "([^\"]*)"$/ do |title|
  When %(I fill in "lending[title]" with "#{title}")
end
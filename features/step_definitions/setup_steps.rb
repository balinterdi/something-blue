Given /^there is a user called "([^\"]*)"$/ do |login|
  Factory(:user, :login => login)
end

# see the thread: http://www.ruby-forum.com/topic/182267#new
Given /^I log in as "([^\"]*)"$/ do |login|
  @user = User.by_login(login)
  webrat.automate do
    visit login_path
    fill_in "user_session_login", :with => login
    fill_in "user_session_password", :with => 'secret'
    click_button 'Log in'
  end

  webrat.simulate do
    post "/user_session", :user_session => { :login => @user.login, :password => 'secret' }
  end
end
  
Given /^I am logged in as "([^\"]*)"$/ do |login|
  Given %(there is a user called "#{login}")
  Given %(I log in as "#{login}")
end
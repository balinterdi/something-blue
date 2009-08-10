require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSession do
  before(:each) do
    @credentials = { :login => "humptydumpty", :password => "secret" }
    @user_session = UserSession.new(@credentials)
  end

  describe "when saved and a user exists with the given credentials" do
    before do
      pending
      @user = User.new(@credentials.merge(:password_confirmation => @credentials[:password]))
      @user_session.save
    end
    it "should be valid" do
      @user_session.should be_valid
    end
    it "the user stored in the session should be the one with the given credentials" do
      @user_session.user.login = @user.login
    end
  end

end
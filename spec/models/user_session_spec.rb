require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSession do
  before(:each) do
    credentials = { :login => "humptydumpty", :password => "secret" }
    @user_session = UserSession.new(credentials)
  end
  
  describe "when a user exists with the given credentials" do
    before do      
      # User.stubs(:authenticate).returns(true)
    end
    it "should be valid" do
      @user_session.should be_valid
    end
    
  end
end
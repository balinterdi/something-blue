require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe User do
  before(:each) do
    @valid_attributes = Factory.attributes_for(:user)
  end

  it "should create a new instance given valid attributes" do
    pending
    User.new(@valid_attributes).save.should == true
  end

  describe "when asked to authenticate" do
    before do
      @attrs = { :login => "humptydumpty", :password => "sickrat" }
      @user = Factory(:user, @attrs)
    end
    it "should return the user if there is a matching user with the given password" do
      User.authenticate(@attrs).login.should == @user.login
    end
    it "should return nil if there is no user with the given login" do
      bad_attrs = @attrs.merge({ :login => "humprey_bogart" })
      User.authenticate(bad_attrs).should be_nil
    end
    it "should return nil if the password is wrong" do
      bad_attrs = @attrs.merge({ :password => "titok" })
      User.authenticate(bad_attrs).should be_nil
    end    
  end
  
  describe "when saved" do
    before do
      @password_attrs = { :password  => "sickrat", :password_confirmation  => "sickrat" }
      @user = User.new( @valid_attributes.merge(@password_attrs) )
      @user.save
      # @user.reload
    end
    it "should have the password properly encrypted" do
      user = User.by_login(@user.login)
      user.encrypted_password.should == User.encrypt_password(@password_attrs[:password])
    end
  end

end

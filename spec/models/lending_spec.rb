require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lending do
  before(:each) do
    @valid_attributes = Factory.attributes_for(:lending)
  end

  it "should create a new instance given valid attributes" do
    pending
    Lending.new(@valid_attributes).save.should == true
  end
end

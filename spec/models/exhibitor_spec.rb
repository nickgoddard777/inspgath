require File.dirname(__FILE__) + '/../spec_helper'

describe Exhibitor do
  before(:each) do
    @attr = { :name => "Test company", :website => "http://www.test.com", :address1 => "1 some street", :address2 => "conisbrough", :city => "doncaster", :county => "s. yorks", :postcode => "dn12 4df", :tel_no => "01709 767676", :email => "test@test.com", :description => "test description"}
  end

  it "should create a new instance given valid attributes" do
    Exhibitor.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require a website" do
    no_website_user = User.new(@attr.merge(:website => ""))
    no_website_user.should_not be_valid
  end

  it "should require a email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end

  it "should require a description" do
    no_description_user = User.new(@attr.merge(:description => ""))
    no_description_user.should_not be_valid
  end

end


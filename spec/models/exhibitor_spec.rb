require File.dirname(__FILE__) + '/../spec_helper'

describe Exhibitor do
  before(:each) do
    @attr = { :name => "Test company", :website => "http://www.test.com", :address1 => "1 some street", :address2 => "conisbrough", :city => "doncaster", :county => "s. yorks", :postcode => "dn12 4df", :tel_no => "01709 767676", :email => "test@test.com", :description => "test description"}
  end

  it "should create a new instance given valid attributes" do
    Exhibitor.create!(@attr)
  end

  it "should require a name" do
    no_name_exhibitor = Exhibitor.new(@attr.merge(:name => ""))
    no_name_exhibitor.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_exhibitor = Exhibitor.new(@attr.merge(:name => long_name))
    long_name_exhibitor.should_not be_valid
  end

  it "should require a website" do
    no_website_exhibitor = Exhibitor.new(@attr.merge(:website => ""))
    no_website_exhibitor.should_not be_valid
  end

  it "should reject website that are too long" do
    long_website = "a" * 101
    long_website_exhibitor = Exhibitor.new(@attr.merge(:website => long_website))
    long_website_exhibitor.should_not be_valid
  end

  it "should reject duplicate website addresses" do
    Exhibitor.create!(@attr)
    exhibitor_with_duplicate_website = Exhibitor.new(@attr)
    exhibitor_with_duplicate_website.should_not be_valid
  end

  it "should require a address1" do
    no_address1_exhibitor = Exhibitor.new(@attr.merge(:address1 => ""))
    no_address1_exhibitor.should_not be_valid
  end

  it "should reject address1 that are too long" do
    long_address1 = "a" * 51
    long_address1_exhibitor = Exhibitor.new(@attr.merge(:address1 => long_address1))
    long_address1_exhibitor.should_not be_valid
  end

  it "should require a address2" do
    no_address2_exhibitor = Exhibitor.new(@attr.merge(:address2 => ""))
    no_address2_exhibitor.should_not be_valid
  end

  it "should reject address2 that are too long" do
    long_address2 = "a" * 51
    long_address2_exhibitor = Exhibitor.new(@attr.merge(:address2 => long_address2))
    long_address2_exhibitor.should_not be_valid
  end

  it "should require a city" do
    no_city_exhibitor = Exhibitor.new(@attr.merge(:city => ""))
    no_city_exhibitor.should_not be_valid
  end

  it "should reject city that are too long" do
    long_city = "a" * 51
    long_city_exhibitor = Exhibitor.new(@attr.merge(:city => long_city))
    long_city_exhibitor.should_not be_valid
  end

  it "should require a county" do
    no_county_exhibitor = Exhibitor.new(@attr.merge(:county => ""))
    no_county_exhibitor.should_not be_valid
  end

  it "should reject county that are too long" do
    long_county = "a" * 51
    long_county_exhibitor = Exhibitor.new(@attr.merge(:county => long_county))
    long_county_exhibitor.should_not be_valid
  end

  it "should require a postcode" do
    no_postcode_exhibitor = Exhibitor.new(@attr.merge(:postcode => ""))
    no_postcode_exhibitor.should_not be_valid
  end

  it "should reject postcode that are too long" do
    long_postcode = "a" * 51
    long_postcode_exhibitor = Exhibitor.new(@attr.merge(:postcode => long_postcode))
    long_postcode_exhibitor.should_not be_valid
  end

  it "should require a tel_no" do
    no_tel_no_exhibitor = Exhibitor.new(@attr.merge(:tel_no => ""))
    no_tel_no_exhibitor.should_not be_valid
  end

  it "should reject tel_no that are too long" do
    long_tel_no = "a" * 51
    long_tel_no_exhibitor = Exhibitor.new(@attr.merge(:tel_no => long_tel_no))
    long_tel_no_exhibitor.should_not be_valid
  end

  it "should require a email" do
    no_email_exhibitor = Exhibitor.new(@attr.merge(:email => ""))
    no_email_exhibitor.should_not be_valid
  end

  it "should reject email that are too long" do
    long_email = "a" * 101
    long_email_exhibitor = Exhibitor.new(@attr.merge(:email => long_email))
    long_email_exhibitor.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_exhibitor = Exhibitor.new(@attr.merge(:email => address))
      valid_email_exhibitor.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_exhibitor = Exhibitor.new(@attr.merge(:email => address))
      invalid_email_exhibitor.should_not be_valid
    end
  end

  it "should reject duplicate email addresses" do
    Exhibitor.create!(@attr)
    exhibitor_with_duplicate_email = Exhibitor.new(@attr)
    exhibitor_with_duplicate_email.should_not be_valid
  end

  it "should require a description" do
    no_description_exhibitor = Exhibitor.new(@attr.merge(:description => ""))
    no_description_exhibitor.should_not be_valid
  end

end


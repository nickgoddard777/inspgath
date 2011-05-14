require 'spec_helper'

describe Contact do
  before(:each) do
    @attr = { :email => "test@user.co.uk", :name => "test user", :contact_type => "Visitor Information", :event => "Mind Body & Spirit", :body => "Test message"}
  end

  it "should require an email" do
    no_email_contact = Contact.new(@attr.merge(:email => ""))
    no_email_contact.should_not be_valid
  end


  it "should require an name" do
    no_name_contact = Contact.new(@attr.merge(:name => ""))
    no_name_contact.should_not be_valid
  end

  it "should require an contact_type" do
    no_contact_type_contact = Contact.new(@attr.merge(:contact_type => ""))
    no_contact_type_contact.should_not be_valid
  end

  it "should require an event" do
    no_event_contact = Contact.new(@attr.merge(:event => ""))
    no_event_contact.should_not be_valid
  end

  it "should require an body" do
    no_body_contact = Contact.new(@attr.merge(:body => ""))
    no_body_contact.should_not be_valid
  end
end


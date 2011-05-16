require File.dirname(__FILE__) + '/../spec_helper'

describe Event do
  before(:each) do
    @attr = { :title => "Test", :description => "Test event", :startdate => "2011-10-01", :enddate => "2011-10-02", :url_link => "http://www.test.com", :category_id => 1}
  end

  it "should create a new instance given valid attributes" do
    Event.create!(@attr)
  end

end


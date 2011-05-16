require File.dirname(__FILE__) + '/../spec_helper'

describe Category do

  before(:each) do
    @attr = { :name => "Test", :description => "This is a test category"}
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@attr)
  end

  it "should require a name" do
    no_name_category = Category.new(@attr.merge(:name => ""))
    no_name_category.should_not be_valid
  end

  it "should have a unique name" do
    Category.create!(@attr)
    category_with_duplicate_name = Category.new(@attr)
    category_with_duplicate_name.should_not be_valid
  end

  it "should require a description" do
    no_description_category = Category.new(@attr.merge(:description => ""))
    no_description_category.should_not be_valid
  end
end


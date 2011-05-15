require 'spec_helper'

describe "Exhibitors" do
  describe "GET /exhibitors" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get exhibitors_index_path
      response.status.should be(200)
    end
  end

  describe "GET /exhibitors/new" do

    describe "failure" do

      it "should not make a new exhibitor" do
        visit new_exhibitor_path
        fill_in "Name",   :with => ""
        fill_in "Website",   :with => ""
        fill_in "Email",   :with => ""
        fill_in "Address1",   :with => ""
        fill_in "Address2",   :with => ""
        fill_in "City",   :with => ""
        fill_in "County",   :with => ""
        fill_in "Postcode",   :with => ""
        fill_in "Tel no",   :with => ""
        fill_in "Description",   :with => ""
        click_button
        response.should render_template('exhibitors/new')
        response.should have_selector("div#error_explanation")
      end
    end
  end
end


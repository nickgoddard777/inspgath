require File.dirname(__FILE__) + '/../spec_helper'

describe ExhibitorsController do
  render_views

  describe "GET 'show'" do

    before(:each) do
      @exhibitor = Factory(:exhibitor)
    end

    it "should be successful" do
      get :show, :id => @exhibitor
      response.should be_success
    end

    it "should find the right exhibitor" do
      get :show, :id => @exhibitor
      assigns(:exhibitor).should == @exhibitor
    end

    it "should have the right title" do
      get :show, :id => @exhibitor
      response.should have_selector("title", :content => @exhibitor.name)
    end

    it "should show the exhibitors name" do
      get :show, :id => @exhibitor
      response.should have_selector("h1", :content => @exhibitor.name)
    end

    it "should show the exhibitors website" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.website)
    end

    it "should show the exhibitors email" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.email)
    end

    it "should show the exhibitors address 1" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.address1)
    end

    it "should show the exhibitors address2" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.address2)
    end

    it "should show the exhibitors city" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.city)
    end

    it "should show the exhibitors county" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.county)
    end

    it "should show the exhibitors postcode" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.postcode)
    end

    it "should show the exhibitors tel no" do
      get :show, :id => @exhibitor
      response.should have_selector("address", :content => @exhibitor.tel_no)
    end

    it "should show the exhibitors description" do
      get :show, :id => @exhibitor
      response.should have_selector("p.description", :content => @exhibitor.description)
    end
  end


  describe "GET 'new'" do

    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Add Exhibitor")
    end
  end

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :name => "", :website => "", :address1 => "", :address2 => "", :city => "", :county => "", :postcode => "", :tel_no => "", :email => "", :description => ""}
      end

      it "should not create a exhibitor" do
        lambda do
          post :create, :exhibitor => @attr
        end.should_not change(Exhibitor, :count)
      end

      it "should have the right title" do
        post :create, :exhibitor => @attr
        response.should have_selector("title", :content => "Add Exhibitor")
      end

      it "should render the 'new' page" do
        post :create, :exhibitor => @attr
        response.should render_template('new')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "Test company", :website => "http://www.test.com", :address1 => "1 some street", :address2 => "conisbrough", :city => "doncaster", :county => "s. yorks", :postcode => "dn12 4df", :tel_no => "01709 767676", :email => "test@test.com", :description => "test description"}
      end

      it "should create a user" do
        lambda do
          post :create, :exhibitor => @attr
        end.should change(Exhibitor, :count).by(1)
      end

      it "should redirect to the exhibitor show page" do
        post :create, :exhibitor => @attr
        response.should redirect_to(exhibitor_path(assigns(:exhibitor)))
      end

      it "should have a created message" do
        post :create, :exhibitor => @attr
        flash[:success].should =~ /Exhibitor successfully created/i
      end
    end
  end
end


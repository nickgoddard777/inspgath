require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do
	render_views
	
	describe "GET 'show'" do
		
		before(:each) do
			@user = Factory(:user)
		end
		
		it "should be successful" do
			get :show,	:id => @user
			response.should be_success
		end
		
		it "should find the right user" do
			get :show, :id => @user
			assigns(:user).should == @user
		end
		
		it "should include the user's name" do
			get :show, :id => @user
			response.should have_selector("h1", :content => @user.name)
		end
	end
  
	describe "GET 'new'" do

		it "should be successful" do
			get'new'
			response.should be_success
		end
	end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => User.first
    response.should render_template(:show)
  end

  it "create action should render new template when model is invalid" do
    User.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(user_url(assigns[:user]))
  end

  it "edit action should render edit template" do
    get :edit, :id => User.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    User.any_instance.stubs(:valid?).returns(false)
    put :update, :id => User.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    User.any_instance.stubs(:valid?).returns(true)
    put :update, :id => User.first
    response.should redirect_to(user_url(assigns[:user]))
  end

  it "destroy action should destroy model and redirect to index action" do
    user = User.first
    delete :destroy, :id => user
    response.should redirect_to(users_url)
    User.exists?(user.id).should be_false
  end
end

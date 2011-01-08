class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to @page
    else
      render :action => 'new'
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to @page
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    redirect_to pages_url
  end
  
  def home
  	@title = "Inspirational Gatherings | Homepage"
  	@page = Page.find_by_page_type('home')
  	render 'display'
  end
  
  def about
  	@title = "Inspirational Gatherings | About Us"
  	@page = Page.find_by_page_type('about')
  	render 'display'
  end
  
  def contact
  	@title = "Inspirational Gatherings | Contact Us"
  	@page = Page.find_by_page_type('contact')
  	render 'display'
  end
end

class ExhibitorsController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :new, :create, :destroy]

  def index
    @exhibitors = Exhibitor.paginate(:page => params[:page])
    @title = "All exhibitors"
  end

  def show
    @exhibitor = Exhibitor.find(params[:id])
    @title = @exhibitor.name
  end


  def new
    @exhibitor = Exhibitor.new
    @title = "Add Exhibitor "
  end

  def create
    @exhibitor = Exhibitor.new(params[:exhibitor])
    if @exhibitor.save
      flash[:success] = "Exhibitor successfully created"
      redirect_to @exhibitor
    else
      @title = "Add Exhibitor"
      render 'new'
    end
  end

  def edit
    @exhibitor = Exhibitor.find(params[:id])
    @title = "Edit exhibitor"
  end

  def update
    @exhibitor = Exhibitor.find(params[:id])
    if @exhibitor.update_attributes(params[:exhibitor])
      flash[:success] = "Exhibitor updated."
      redirect_to @exhibitor
    else
      @title = "Edit exhibitor"
      render 'edit'
    end
  end

  private

    def authenticate
      deny_access unless signed_in?
    end
end


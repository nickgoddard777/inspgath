class ExhibitorsController < ApplicationController

  def show
    @exhibitor = Exhibitor.find(params[:id])
    @title = "Inspirational Gatherings | " + @exhibitor.name
  end


  def new
    @exhibitor = Exhibitor.new
    @title = "Inspirational Gatherings | Add Exhibitor "
  end

  def create
    @exhibitor = Exhibitor.new(params[:exhibitor])
    if @exhibitor.save
      flash[:success] = "Exhibitor successfully created"
      redirect_to @exhibitor
    else
      @title = "Inspirational Gatherings | Add Exhibitor"
      render 'new'
    end
  end
end


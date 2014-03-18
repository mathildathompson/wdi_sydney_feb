class OceansController < ApplicationController
  def index
    @oceans = Ocean.order(:area => :desc)
  end

  def show
    @ocean = Ocean.find params[:id]
  end

  def destroy
    ocean = Ocean.find params[:id]
    ocean.destroy
    redirect_to(oceans_path)
  end

  def new
    @ocean = Ocean.new
  end

  def create
    ocean = Ocean.new(params[:ocean])
    ocean.save
    redirect_to(ocean_path(ocean.id))
  end

  def update
    ocean = Ocean.find params[:id]
    ocean.update_attributes(params[:ocean])
    redirect_to(ocean_path(ocean.id))
  end

  def edit
    @ocean = Ocean.find params[:id]
  end
end

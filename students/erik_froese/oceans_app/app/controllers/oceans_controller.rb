class OceansController < ApplicationController
   skip_before_action :verify_authenticity_token

  def index
    @oceans = Ocean.all
  end

  def new
  end

  def create
    Ocean.create(params[:ocean])
    redirect_to oceans_path
  end

  def show
    @ocean = Ocean.find params[:id]
  end

  def edit
    @ocean = Ocean.find params[:id]
  end

   def update
    ocean = Ocean.find params[:id]
    ocean.update_attributes(params[:ocean])
    redirect_to oceans_path
  end

  def destroy
    ocean = Ocean.find params[:id]
    ocean.destroy
    redirect_to oceans_path
  end
end

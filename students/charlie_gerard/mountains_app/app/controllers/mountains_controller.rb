class MountainsController < ApplicationController
	 skip_before_action :verify_authenticity_token
  def index
  	@mountains = Mountain.order(:name)
  end

  def home
  end

  def new
  end

  def edit
  	@mountain = Mountain.find params[:id]
  end

  def create
  	Mountain.create(params[:mountain])
  	redirect_to mountains_path
  end

  def show
  	@mountain = Mountain.find params[:id]
  end

  def destroy
  	@mountain = Mountain.find params[:id]
  	@mountain.destroy 
  	redirect_to index_path
  end

  def update
  	mountain = Mountain.find params[:id]
  	mountain.update_attributes(params[:mountain])
    redirect_to mountains_path
  end
end

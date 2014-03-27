class MountainsController < ApplicationController
  
  skip_before_action :verify_authenticity_token

  def index
    @mountains = Mountain.all
  end

  def show
    @mountain = Mountain.find params[:id]
  end

  def new
  end

  def create
    Mountain.create(params[:mountain])
    redirect_to mountain_show_path(mountain.id)
  end

  def edit
    @mountain = Mountain.find params[:id]
  end

  def update
    mountain = Mountain.find params[:id]
    mountain.update_attributes(params[:mountain])
    redirect_to mountain_show_path(mountain.id)
  end

  def destroy
    mountain = Mountain.find params[:id]
    mountain.destroy
    redirect_to mountains_path
  end

end

class MountainsController < ApplicationController
  skip_before_action :verify_authenticty_token
   skip_before_filter :verify_authenticity_token 

  def index
    @mountains = Mountain.all
  end

  def new
  end

  def create
    Mountain.create(params[:mountain])
    redirect_to mountains_path
  end

  def show
    @mountain = Mountain.find params[:id]
  end

  def edit
    @mountain = Mountain.find params[:id]
  end

  def destroy
    mountain = Mountain.find params[:id]
    mountain.destroy
    redirect_to mountains_path
  end

  def update
    @mountain = Mountain.find params[:id]
    redirect_to mountains_path
  end

end

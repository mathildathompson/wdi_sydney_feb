class HomeController < ApplicationController

  def index
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
  end

  def countries
  	@countries = Country.offset(params[:offset]).limit(params[:step])
  	render :json => @countries

  end

end

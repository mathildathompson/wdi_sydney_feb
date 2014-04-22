class HomeController < ApplicationController

  def index
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
  end

  def countries
    @countries = Country.select([:id, :abbreviation, :name, :north_america]).limit(params[:step]).offset(params[:offset]);
    render :json => @countries
  end

  def country
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
    render :json => @countries
  end

end

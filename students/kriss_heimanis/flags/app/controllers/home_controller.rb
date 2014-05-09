class HomeController < ApplicationController

  def index
    # binding.pry
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
  end

  def countries
    # binding.pry
    @countries = Country.all
    render :json => @countries
  end

  def x_countries
    # binding.pry
    @countries = Country.find(:all, :limit => params[:number])
    render :json => @countries
  end

  def x_from_y_countries
    # binding.pry
    @countries = Country.find(:all, :limit => params[:number], :offset => params[:offset])
    render :json => @countries
  end

  def none
    # binding.pry
    @countries = Country.find(:all, :limit => params[:number], :offset => params[:offset])
    render :json => @countries
  end


end

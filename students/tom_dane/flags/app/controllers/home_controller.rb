# require 'pry'

class HomeController < ApplicationController

  def index
    
  end

  def countries

    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
    @c = @countries.offset(params[:step]).limit(params[:offset])
    render :json => @c
    # binding.pry
  end

   

end

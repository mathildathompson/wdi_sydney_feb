class HomeController < ApplicationController

  def index
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
  end

  def countries
    @countries = Country.offset(params[:offset]).limit(params[:step])
    # binding.pry
    # @countries = Country.limit(10)

    respond_to do |format|
      format.html
      format.json {render :json => @countries}
    end
  end

  def allcountries
    @countries = Country.all

    respond_to do |format|
      format.html
      format.json {render :json => @countries}
    end
  end

end

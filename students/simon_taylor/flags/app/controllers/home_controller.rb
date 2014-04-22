class HomeController < ApplicationController

  def index
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
  end

  def countries
    #starting country
    fromID = params[:fromID]
    #how many countries to fetch
    limit = params[:limit]

    #if no limit was provided, fetch all countries
    if limit
      countries = Country.where("id > #{fromID}").limit(limit)
    else
      countries = Country.where("id > #{fromID}")
    end

    respond_to do |format|
      format.json {render :json => countries}
    end
  end

end

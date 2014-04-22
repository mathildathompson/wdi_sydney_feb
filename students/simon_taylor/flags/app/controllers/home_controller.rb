class HomeController < ApplicationController

  def index
    @countries = Country.select([:id, :abbreviation, :name, :north_america]);
  end

  def countries
    #starting country
    fromID = params[:fromID]
    #how many countries to fetch
    limit = params[:limit]

    countries = Country.where("id > #{fromID}").limit(limit)

    respond_to do |format|
      format.json {render :json => countries}
    end
  end

end

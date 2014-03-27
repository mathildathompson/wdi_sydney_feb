class PagesController < ApplicationController
    skip_before_action  :verify_authenticity_token

    def home
    end

    def oceans
        @oceans = Ocean.all
    end

    def create
       

    end


    def done
         Ocean.create(params[:ocean])
         redirect_to oceans_path
    end

    def show

        @ocean = Ocean.find params[:id]
    end
end


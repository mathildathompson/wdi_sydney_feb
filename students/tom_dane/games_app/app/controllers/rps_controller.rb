class RpsController < ApplicationController
  def index
  end

  def create
    @choice = params[:choice]
    @choice = @choice.to_sym.downcase
    @ai = [:paper,:rock,:scissors].sample
    @rules = {
    :rock     => {:rock => :draw, :paper => :lose, :scissors => :win},
    :paper    => {:rock => :win, :paper => :draw, :scissors => :lose},
    :scissors => {:rock => :lose, :paper => :win, :scissors => :draw}
    }

    @display = @rules[@choice][@ai] 
    
     
   
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end

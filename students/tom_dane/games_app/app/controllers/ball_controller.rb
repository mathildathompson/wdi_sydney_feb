class BallController < ApplicationController
  def index
    
  end

  def create
    @question = params[:question]
    @answer = [true, false].sample
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

# Magic 8 ball takes user's questions from the the URL as params and returns a positive or negative answer.
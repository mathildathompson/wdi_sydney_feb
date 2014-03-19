class SecretController < ApplicationController
  def index
  end

  def create
    @guess = params[:guess]
    @answer = rand(1..10)
    @guess = @guess.to_i
    if @guess == @answer
        @display = "You got it right!"
    else
        @display = "You got it wrong sorry."
    end
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

#Users click a number between 1 and 10. The controller validates the guess and renders the win or lose view.
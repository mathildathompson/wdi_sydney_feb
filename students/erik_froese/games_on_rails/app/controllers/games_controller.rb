class GamesController < ApplicationController
  def index
  end

  def eightball
  end

  def question
    @question = params[:question]
    @answer = ["It is certain","It is decidedly so","Without a doubt","Yes definitely","You may rely on it","As I see it, yes","Most likely","Outlook good","Yes","Signs point to yes","Reply hazy try again","Ask again later","Better not tell you now","Cannot predict now","Concentrate and ask again","Don't count on it","My reply is no","My sources say no","Outlook not so good","Very doubtful"].sample
  end

  def paper_rock_scissors
   @answer = params[:prs_id]
    @p_r_s = ["paper", "rock", "scissors"].sample

    if @answer == @p_r_s
      @whowins = "It's a tie."
    elsif (@answer == "rock") && (@p_r_s == "paper")
      @whowins = "You lose!"
    elsif (@answer == "rock") && (@p_r_s == "scissors")
      @whowins = "You win!"
    elsif (@answer == "scissors") && (@p_r_s == "paper")
      @whowins = "You win!"
    elsif (@answer == "scissors") && (@p_r_s == "rock")
      @whowins = "You lose!"
    elsif (@answer == "paper") && (@p_r_s == "rock")
      @whowins = "You win!"
    elsif (@answer == "paper") && (@p_r_s == "scissors")
      @whowins = "You lose!"
    end
  end

  def secret_number
    @number = (1..10).to_a.shuffle.pop
    @guess = params[:guess]
    if @guess == nil
      @output = "I'm thinking of a number between 1 and 10. Can you guess what it is?"
    elsif @guess == @number
      @output = "Holy shit. You had a one-in-ten chance, and you got it right."
    else 
      @output = "Wrong. I guessed #{@number} and you guessed #{@guess}. Guess again."
    end

  end
end
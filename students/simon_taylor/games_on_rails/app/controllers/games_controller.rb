class GamesController < ApplicationController

  def index
  end

  def magic_8
    responses = ['It is certain','It is decidedly so','Without a doubt','Yes definitely','You may rely on it','As I see it, yes','Most likely','Outlook good','Yes','Signs point to yes','Reply hazy try again','Ask again later','Better not tell you now','Cannot predict now','Concentrate and ask again','Don\'t count on it','My reply is no','My sources say no','Outlook not so good','Very doubtful']
    @response = responses.sample

  end

  def secret_number
    secret = (1..10).to_a.sample

    if params[:guess] != nil
      guess = params[:guess].to_i
      case
      when guess <= 0 || guess > 10
        @response = "Good one retard! It has to be a number between 1-10"
      when guess.to_i == secret
        @response = "Well done, the number was #{secret}"
      else
        @response = "Sorry, the number was #{secret}"
      end #end of case
    end #end of if

  end

  def rock_paper_scissors
    #Selection and then what it is beats in the dual
    options = {'Rock' => 'Scissors', 'Paper' => 'Rock', 'Scissors' => 'Paper'}

    #cpu's choice (random)
    @cpu = options.keys.sample
    #user's selection
    @user = params[:choice].capitalize

    if @user != nil
      @response = case
                  when !(options.has_key? @user)
                    "Good one retard! It has to be either Rock, Paper or Scissors"
                  when options[@user] == @cpu
                    "Dop! I chose #{@cpu}"
                  when @user == @cpu
                    "I chose #{@cpu}, jolly good ole' chap, we'll call it a draw"
                  else
                    "I win bitch, eat my #{@cpu}!"
                  end #end of case
    end #end of if

    # raise @response.inspect
  end

end
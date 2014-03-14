require 'pry'
require 'sinatra'
require 'sinatra/reloader'

# hash of all stations and lines
before do 
   @subway = {
    :nline => ['Times Square','34th','28th','23rd','Union Square','8th'],
    :lline => ['8th','6th','Union Square','3rd','1st'],
    :sixline => ['Grand Central','33rd','28th','23rd','Union Square','Astor']
  }
end

get '/' do
  erb :home
end

get '/post/' do
  # start values 
  @line_start = params[:station_start].split('_')[0]
  @station_start = params[:station_start].split('_')[1]

  # end values
  @line_end = params[:station_end].split('_')[0]
  @station_end = params[:station_end].split('_')[1]

  #error check for union square
  if @station_end == "Union Square"
    @line_end = @line_start
  end
  
  # if start/end on same line
  if @line_start == @line_end 
    # calculate number of stops
    @stops_number = @subway[@line_start.to_sym].index(@station_start) - @subway[@line_end.to_sym].index(@station_end)
    
    # create new array of stations - FUCK needs to put the bigger value first!
    if @stops_number > 0
      @trip = @subway[@line_start.to_sym][@subway[@line_end.to_sym].index(@station_end)..@subway[@line_start.to_sym].index(@station_start)].reverse
    else 
      @trip = @subway[@line_start.to_sym][@subway[@line_start.to_sym].index(@station_start)..@subway[@line_end.to_sym].index(@station_end)]
    end
    erb :no_change
  
  # if start/end on different lines do two calculations
  else
    # calculate number of stops
    @first_leg = @subway[@line_start.to_sym].index("Union Square") - @subway[@line_start.to_sym].index(@station_start)
    
    # create new array of stations
    if @first_leg > 0
      @trip1 = @subway[@line_start.to_sym][@subway[@line_start.to_sym].index(@station_start)..@subway[@line_start.to_sym].index("Union Square")]
    else
      @trip1 = @subway[@line_start.to_sym][@subway[@line_start.to_sym].index("Union Square")..@subway[@line_start.to_sym].index(@station_start)].reverse
    end
    
    # calculate number of stops
    @second_leg = @subway[@line_end.to_sym].index("Union Square") - @subway[@line_end.to_sym].index(@station_end)
    # create new array of stations
    if @second_leg < 0
      @trip2 = @subway[@line_end.to_sym][@subway[@line_end.to_sym].index("Union Square")..@subway[@line_end.to_sym].index(@station_end)]
    else
      @trip2 = @subway[@line_end.to_sym][@subway[@line_end.to_sym].index(@station_end)..@subway[@line_end.to_sym].index("Union Square")].reverse
    end
    erb :change
  end
end
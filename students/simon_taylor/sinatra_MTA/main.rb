require 'sinatra'
require 'sinatra/reloader'
require 'pry'

before do
  @lines = {'N' => ['Times Square','34th','28th','23rd','Union Square','8th'],
          'L' => ['8th','6th','Union Square','3rd','1st'],
          '6' => ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']}
end

get '/' do 

  @line_stop = []
  
  @lines.each do |line, stops|
    stops.each do |stop|
      @line_stop.push "#{line}-#{stop}"
    end
  end

  if params[:from_stop] != nil

    # {"from_stop"=>"N-Times Square", "to_stop"=>"L-6th"}
    from_line = params[:from_stop].split("-")[0]
    from_stop = params[:from_stop].split("-")[1]
    @to_line = params[:to_stop].split("-")[0]
    to_stop = params[:to_stop].split("-")[1]

    #find stop number for from stop
    curr_stop_no = @lines[from_line].index(from_stop)

    #find stop number for to stop
    dest_stop_no = @lines[@to_line].index(to_stop)

    #the current line and destination line are the same, so count how far apart the stations are
    if from_line == @to_line

      #calculate the distance to the destination
      @distance = (curr_stop_no - dest_stop_no).abs

      #change stations not needed
      @change = false

    #the destination is not on the current line
    else

      #find Union Square on the current line
      curr_union = @lines[from_line].index("Union Square")
      #find Union Square on the destination line
      dest_union = @lines[@to_line].index("Union Square")

      #calculate distance on th current line to Union Square
      distance1 = curr_stop_no - curr_union
      #calculate distance on the destination line to Union Square
      distance2 = dest_stop_no - dest_union
      #calculate the total distance
      @distance = distance1.abs + distance2.abs

      #change stations needed IF destination is not Union Square
      to_stop != "Union Square" ? @change = true : @change = false

    end #end of if from_line = to_line

  end #end of if params

  erb :home

end #end of route
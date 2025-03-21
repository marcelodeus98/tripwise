require 'sinatra'
require './lib/travel'

before do
  if request.content_type == 'application/json'
    body = request.body.read
    params.merge!(JSON.parse(body, symbolize_names: true))
  end
end

post '/travel_plan' do
  puts params
  escorts = params[:escorts] || [{ has_escorts: false, quantity: 0 }]
  has_escorts = escorts[0][:has_escorts] rescue false
  quantity = escorts[0][:quantity] rescue 0

  response = Travel
    .new
    .with_dates(params[:start_date], params[:end_date])
    .from(params[:origin])
    .to(params[:destination])
    .budget(params[:budget])
    .escorts(has_escorts, quantity)
    .plan!
 
  content_type :json
  response.to_json
end

get '/' do
  "Bem-vindo à TripWise"
end
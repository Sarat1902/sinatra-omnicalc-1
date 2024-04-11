require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end


get("/square/new") do
  erb(:new_square)
end

get("/square/results") do
  @num = params.fetch("num").to_f
  @results = @num ** 2
  erb(:square_results)
end

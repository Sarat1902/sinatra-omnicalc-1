require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:new_square)
end

get("/square/results") do
  @num = params.fetch("num").to_f
  @results = @num ** 2
  erb(:square_results)
end

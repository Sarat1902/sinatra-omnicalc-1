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

get("/square_root/new") do
  erb(:new_square)
end

get("/square_root/results") do
  @num = params.fetch("num").to_f
  @results = @num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment)
end


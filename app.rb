require "sinatra"
require "sinatra/reloader"
require "active_support/all"
require "./app"

get("/") do
  erb(:new_square)
end

get("/square/new") do
  erb(:new_square)
end

get("/square/results") do
  @num = params.fetch("num").to_f
  @results = @num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root)
end

get("/square_root/results") do
  @num = params.fetch("num").to_f
  @results = @num ** 0.5
  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @interest = params.fetch("interest").to_f 
  @rate = @interest.to_fs(:percentage,{:precision => 4})

  @r = @interest / 12 / 100

  @years = params.fetch("years").to_i
  @n = @years * 12

  @principal = params.fetch("principal").to_f
  @p = @principal.to_fs(:currency)
  
  @numerator = @principal * @r
  
  @d =  1 + @r
  @db = @d ** @n
  @dr = 1 / @db
  @denom = 1 - @dr
  
  @payment = @numerator/@denom
  @results = @payment.to_fs(:currency, {:precision => 2})

  erb(:payment_results)

end


get("/random/new") do
  erb(:new_random)
end


get("/random/results") do
  @num1 = params.fetch("Minimum").to_f
  @num2 = params.fetch("Maximum").to_f

  @results = rand(@num1 .. @num2)

  erb(:random_results)
end

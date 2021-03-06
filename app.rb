require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('pry')

get("/") do
  erb(:input)
end

get ("/output") do
  @height = params.fetch("height")
  @width = params.fetch("width")
  @length = params.fetch("length")
  @weight = params.fetch("weight")
  @distance = params.fetch("distance")
  @speed = params.fetch("speed")
  @coupon = params.fetch("coupon")
  @wrapping = params.fetch("wrapping")

  parcel = Parcel.new(@height, @width, @length, @weight, @distance, @speed, @coupon, @wrapping)


  @total_cost = parcel.cost_to_ship
  @shipping_cost = parcel.shipping_cost
  @wrapping_cost = parcel.wrapping_cost
  # binding.pry
  erb(:output)
end

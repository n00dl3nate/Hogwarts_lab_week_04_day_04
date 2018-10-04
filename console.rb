require("sinatra")
require("sinatra/contrib/all")
require("pry")
require_relative("./models/hogwarts")
require_relative("./models/house")
also_reload("./models/*")

get "/hogwarts" do
  @students = Student.all
  erb(:index)
end

get "/hogwarts/new" do
  erb(:new)
end

post "/hogwarts" do
  @student = Student.new(params)
  @student.save
  erb(:create)
end

get "/hogwarts/houses" do
  @houses = House.all
  erb(:houses)
end

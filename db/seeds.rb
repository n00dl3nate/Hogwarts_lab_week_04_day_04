require_relative('../models/hogwarts')
require_relative('../models/house')
require("pry")
Student.delete_all
House.delete_all




house1 = House.new({
  "name" => "Gryffindor",
  "logo" => "https://www.pinterest.com/pin/552253973033771460/"

  })

house2 = House.new({
  "name" => "Slytherin",
  "logo" => "http://harrypotter.wikia.com/wiki/File:Slytherin%E2%84%A2_Crest_(Painting).png"
  })

house3 = House.new({
  "name" => "Hufflepuff",
  "logo" => "view-source:http://harrypotter.wikia.com/wiki/Hufflepuff?file=0.51_Hufflepuff_Crest_Transparent.png"
    })

house4 = House.new({
  "name" => "Ravenclaw",
  "logo" => "https://www.google.co.uk/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwis0Y792OzdAhVOyoUKHc2XAyMQjRx6BAgBEAU&url=http%3A%2F%2Fharrypotter.wikia.com%2Fwiki%2FRavenclaw&psig=AOvVaw273z2AZO_4ttddSKpOQR48&ust=1538739366075232"
    })

house1.save
house2.save
house3.save
house4.save

student1 = Student.new(
  {
    "first_name" => "Harry",
    "last_name" => "Potter",
    "age" => 13,
    "house_id" => house1.id
  }
)

student2 = Student.new(
  {
    "first_name" => "Draco",
    "last_name" => "Malfoy",
    "age" => 13,
    "house_id" => house2.id
  }
)


student1.save
student2.save


      binding.pry
      nil

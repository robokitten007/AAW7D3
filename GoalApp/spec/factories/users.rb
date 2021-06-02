FactoryBot.define do
  factory :user do
     # Curly braces are a code block to run each time the factory is used to create a user
     email { Faker::Internet.email }
     password { "password" }
     age { 20 }

     factory :harry_potter do
         username { "Harry Potter" }
         political_affiliation { "Gryffindor" }
     end
 end
end

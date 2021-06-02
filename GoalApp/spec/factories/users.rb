FactoryBot.define do
  factory :user do
     # Curly braces are a code block to run each time the factory is used to create a user
     email { Faker::Internet.email }
     password { "password" }

     factory :harry_potter do  #not sure what's going on here.
         email { "harry@porter.com" }
     end
 end
end

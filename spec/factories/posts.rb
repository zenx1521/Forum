FactoryBot.define do 
    factory :post do
        user {User.find(5)}
        title {Faker::Lorem.sentence}
        content {Faker::Lorem.paragraph}
    end 

    factory :invalid_post, parent: :post do
        user {User.find(5)}
        title {nil}
    end
end 


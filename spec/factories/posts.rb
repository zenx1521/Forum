FactoryBot.define do 
    factory :post do
        title {Faker::Lorem.sentence}
        content {Faker::Lorem.paragraph}
    end 

    factory :invalid_post, parent: :post do
        title {nil}
    end
end 


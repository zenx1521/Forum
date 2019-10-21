FactoryBot.define do 
    factory :post do
        user {FactoryBot.create(:user)}
        title {Faker::Lorem.sentence}
        content {Faker::Lorem.paragraph}
    end 

    factory :invalid_post, parent: :post do
        user {FactoryBot.create(:user)}
        title {nil}
    end
end 


FactoryGirl.define do 
    factory :user do
        email "test4@gmail.com"
        password "123456"
    end
end  


FactoryGirl.define do 
    factory :post do
        user {create(:user)}
        title {Faker::Lorem.sentence}
        content {Faker::Lorem.paragraph}
    end 
end 


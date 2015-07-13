FactoryGirl.define do
  factory :user do
    email      { Faker::Internet.email }
    password   { Faker::Code.isbn }
    first_name { Faker::Name.first_name }
    last_name  { Faker::Name.last_name }
    api_key    { Faker::Bitcoin.address }

    factory :user_with_website_and_animations do

      after(:create) do |user|
        user.animations << create_list(:animation, 10, :user => user)
        user.websites    << create(:website_with_webpages, :user => user)
      end
    end

  end

end

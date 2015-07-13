FactoryGirl.define do
  factory :website do
    url { Faker::Internet.url }
    user

    factory :website_with_webpages do

      after(:create) do |website|
        website.webpages << create_list(:webpage_with_animated_elements, 5, :website => website)
      end
    end

  end

end

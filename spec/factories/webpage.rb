FactoryGirl.define do
  factory :webpage do
    path { Faker::Internet.domain_word }
    website

    factory :webpage_with_animated_elements do

      after(:create) do |webpage|
        webpage.animated_elements << create_list(:animated_element, rand(5..10), :webpage => webpage)
      end
    end

  end

end

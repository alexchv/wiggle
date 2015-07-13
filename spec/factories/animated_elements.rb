FactoryGirl.define do
  factory :animated_element do
    html_tag     { %w(a div span li button).sample }
    html_id      { Faker::Lorem.word }
    html_classes { Faker::Lorem.words.join(' ') }
    jq_selector  { Faker::Team.creature }
    animation    { Animation.random_record }
    webpage
  end

end

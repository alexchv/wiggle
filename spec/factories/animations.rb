FactoryGirl.define do
  factory :animation do
    name           { Faker::Lorem.word }
    html_attribute { [%w(# .).sample, Faker::Commerce.color].join  }
    delay          { rand(1..5) }
    duration       { rand(2..10) }
    count          { %w(once infinite).sample }
    animation_type { AnimationType.random_record }
    user
  end

end

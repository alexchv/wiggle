require 'spec_helper'

describe Animation, :type => :model do
  before(:each) do
    @animation = create(:animation, :animation_type => AnimationType.random_record, :user => create(:user))
  end

  # ActiveRecord matchers
  it { should define_enum_for(:count) }

  it { should belong_to(:animation_type) }
  it { should belong_to(:user) }
  it { should have_many(:animated_elements).dependent(:destroy) }

  # ActiveModel matchers
  it { should validate_presence_of(:animation_type) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:count) }

  it { should validate_numericality_of(:delay).is_greater_than_or_equal_to(0.1).is_less_than_or_equal_to(10) }
  it { should validate_numericality_of(:duration).is_greater_than_or_equal_to(0.1).is_less_than_or_equal_to(10) }

  it { should validate_length_of(:name).is_at_least(2).is_at_most(52) }
  it { should validate_length_of(:html_attribute).is_at_least(2).is_at_most(52) }
end

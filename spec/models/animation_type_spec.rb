require 'spec_helper'

describe AnimationType, :type => :model do
  before(:each) do
    @animation_type = AnimationType.random_record
  end

  # ActiveRecord matchers
  it { should define_enum_for(:status) }

  it { should belong_to(:animation_category) }

  it { should have_many(:animations).dependent(:destroy) }

  # ActiveModel matchers
  it { should validate_presence_of(:status) }
end

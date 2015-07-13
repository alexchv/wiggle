require 'spec_helper'

describe User, :type => :model do
  before(:each) do
    @user = create(:user)
  end

  # ActiveRecord matchers
  it { should have_many(:animations).dependent(:destroy) }
  it { should have_many(:websites).dependent(:destroy) }
  it { should have_many(:webpages).through(:websites) }
  it { should have_many(:animated_elements).through(:webpages) }

  # ActiveModel matchers
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }

  it { should validate_length_of(:email).is_at_most(254) }
  it { should validate_length_of(:first_name).is_at_most(254) }
  it { should validate_length_of(:last_name).is_at_most(254) }
end

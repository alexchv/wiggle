require 'spec_helper'

describe Website, :type => :model do
  before(:each) do
    @website = create(:website, :user => create(:user))
  end

  # ActiveRecord matchers
  it { should belong_to(:user) }

  it { should have_many(:webpages).dependent(:destroy) }

  it { should validate_uniqueness_of(:url) }

  # ActiveModel matchers
  it { should validate_presence_of(:user) }
end

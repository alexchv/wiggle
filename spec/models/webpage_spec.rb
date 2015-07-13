require 'spec_helper'

describe Webpage, :type => :model do
  before(:each) do
    @webpage = create(:webpage, :website => create(:website, :user => create(:user)))
  end

  # ActiveRecord matchers
  it { should belong_to(:website) }

  it { should have_many(:animated_elements).dependent(:destroy) }

  # ActiveModel matchers
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:path) }

  it { should validate_length_of(:path).is_at_most(254) }

  # Independent matchers
  it { should delegate_method(:user).to(:website) }
end

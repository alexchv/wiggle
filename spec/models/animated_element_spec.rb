require 'spec_helper'

describe AnimatedElement, :type => :model do
  before(:each) do
    user = create(:user)
    @animated_element = create(:animated_element,
                               :webpage => create(:webpage, :website => create(:website, :user => user)),
                               :animation => create(:animation, :animation_type => AnimationType.random_record, :user => user))
  end

  # ActiveRecord matchers
  it { should belong_to(:animation) }
  it { should belong_to(:webpage) }

  # ActiveModel matchers
  it { should validate_length_of(:html_tag).is_at_least(1).is_at_most(10) }
end

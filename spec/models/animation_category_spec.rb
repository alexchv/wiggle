require 'spec_helper'

describe AnimationCategory, :type => :model do
  before(:each) do
    @animation_category = AnimationCategory.random_record
  end

  # ActiveRecord matchers
  it { should have_many(:animation_types).dependent(:nullify) }
end

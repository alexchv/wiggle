class AnimationType < Base::SeedModel
  enum :status => { :enabled => 0, :disabled => 1 }

  belongs_to :animation_category

  has_many :animations, :dependent => :destroy

  validates :status, :presence => true

end

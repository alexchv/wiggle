class AnimationCategory < Base::SeedModel

  has_many :animation_types, :dependent => :nullify

end

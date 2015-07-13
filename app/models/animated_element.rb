class AnimatedElement < Base::VersionModel

  belongs_to :animation
  belongs_to :webpage

  validates :animation,
            :webpage,
            :presence => true

  validates :html_tag, :length => {
                         :minimum => 1,
                         :maximum => 10
                       }

end

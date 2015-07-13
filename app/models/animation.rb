class Animation < Base::VersionModel
  enum :count => {:once => 0, :infinite => 1}

  belongs_to :animation_type
  belongs_to :user

  has_many :animated_elements, :dependent => :destroy

  validates :animation_type,
            :user,
            :count,
            :presence => true

  validates :delay,
            :duration,
            :numericality => {
                :greater_than_or_equal_to => 0.1,
                :less_than_or_equal_to => 10
            }

  validates :name,
            :html_attribute,
            :length => {
                :minimum => 2,
                :maximum => 52
            }

end

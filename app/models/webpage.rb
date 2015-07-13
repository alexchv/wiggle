class Webpage < Base::VersionModel

  belongs_to :website

  has_many :animated_elements, :dependent => :destroy

  delegate :user, :to => :website

  validates :website,
            :path,
            :presence => true

  validates :path, :length => {:maximum => 254}

end

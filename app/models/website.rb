class Website < Base::VersionModel

  belongs_to :user

  has_many :webpages, :dependent => :destroy

  validates :url, :uniqueness => true

  validates :user, :presence => true

  validates :url, :url => true

end

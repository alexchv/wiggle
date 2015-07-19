class Website < Base::VersionModel

  belongs_to :user

  has_many :webpages, :dependent => :destroy

  before_validation :format_website

  validates :url, :uniqueness => true

  validates :user, :presence => true

  validate :website_validator

  private

    def format_website
      self.url = "http://#{self.url}" unless self.url[/^https?/]
    end

    def website_validator
      errors.add(:url, 'is not valid') unless website_valid?
    end

    def website_valid?
      !!url.match(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-=\?]*)*\/?$/)
    end

end

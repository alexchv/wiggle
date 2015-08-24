class Website < Base::VersionModel

  attr_accessor :web_url

  belongs_to :user

  has_many :webpages, :dependent => :destroy

  before_validation :format_website

  validates :url, :uniqueness => true

  validates :user, :presence => true

  validate :website_validator

  after_create :add_root_page

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

    def add_root_page
      webpages.create({:path => '/'})
    end

end

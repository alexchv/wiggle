class User < Base::VersionModel

  has_many :animations,        :dependent => :destroy
  has_many :websites,          :dependent => :destroy
  has_many :webpages,          :through => :websites
  has_many :animated_elements, :through => :webpages

  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :email, :email => true

  validates :first_name,
            :last_name,
            :presence => true

  validates :email,
            :first_name,
            :last_name,
            :length => {:maximum => 254}

  after_validation :generate_api_key

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data['email']).first

    unless user
      #todo adv lock
      user = User.create({
         :email      => data['email'],
         :photo_url  => data['image'],
         :first_name => data['first_name'],
         :last_name  => data['last_name'],
         :password   => Devise.friendly_token[0,20]
      })
    end
    user
  end

  def wizard_complete?
    wizard_complete
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  private

    def generate_api_key
      self.api_key = SecureRandom.hex(20)
    end

end

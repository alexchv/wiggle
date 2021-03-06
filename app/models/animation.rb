class Animation < Base::VersionModel
  enum :count => {:once => 0, :infinite => 1}

  attr_accessor :element_tag,
                :element_id,
                :element_classes,
                :element_jq_selector

  belongs_to :animation_type
  belongs_to :user

  has_many :animated_elements, :dependent => :destroy

  before_validation do
    self.html_attribute = ''
  end

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
            # :html_attribute,
            :length => {
                :minimum => 2,
                :maximum => 52
            }

  after_create :link_element

  private

    def link_element
      self.animated_elements.create({
                                :webpage => User.current.websites.first.andand.webpages.first,
                                :html_tag => element_tag.downcase,
                                :html_id => element_id,
                                :html_classes => element_classes,
                                :jq_selector => element_jq_selector
                               })
    end

end

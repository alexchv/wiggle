class AnimatedElement < Base::VersionModel

  belongs_to :animation
  belongs_to :webpage

  validates :animation,
            :webpage,
            :presence => true

  validates :html_tag, :length => {
                         :minimum => 1
                       }

  class << self

    def find_by_html(html_tag, html_id, html_classes)
      self.where({ :html_tag => html_tag.downcase, :html_classes => html_classes, :html_id => html_id }).first
    end

  end

end

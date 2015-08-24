class AnimatedElement < Base::VersionModel

  belongs_to :animation
  belongs_to :webpage

  delegate :animation_type, :to => :animation, :allow_nil => true, :prefix => false

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

  def id_to_jq
    return '' if html_id.empty?
    "##{html_id}"
  end

  def classes_to_jq
    return '' if html_classes.empty?
    jq_classes = html_classes.gsub(' ', '.')
    jq_classes.prepend('.')
  end

end

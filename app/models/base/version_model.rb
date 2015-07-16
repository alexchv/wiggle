class Base::VersionModel < Base::Model
  self.abstract_class = true

  has_paper_trail

  def history
    PaperTrail::Version.where({:item_type => self.class.name, :item_id => id}).to_a.map(&:reify)
  end

  def restore_object(item_type, item_id)
    PaperTrail::Version.where({:item_type => item_type, :item_id => item_id}).where.not(object: nil).order(:created_at).last.andand.reify
  end

  def clear_hash_recursively(hash)
    hash.delete_if { |k, v|
      v.kind_of?(Hash) ? v.delete_if {|key, value| value.nil?} == nil : v.nil?
    }
  end

  class << self

    def versionable_models
      @versionable_models ||= descendants.select { |child| !child.abstract_class }
    end
    alias :models :versionable_models

  end

end
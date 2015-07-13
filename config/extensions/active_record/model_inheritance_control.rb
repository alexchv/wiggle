# a bit of error-proofing for model classes (inherit from BaseModel child classes whenever possible)
module ModelInheritanceControl
  include ::BaseInheritanceControl

  CHILDREN_NAMES = %w(Base::Model PaperTrail::Version PaperTrail::VersionAssociation)

  def inherited(child_class)
    super(child_class)
    inherited_extension(child_class, CHILDREN_NAMES, CHILDREN_NAMES[0])
  end
end

ActiveRecord::Base.send(:extend, ModelInheritanceControl)
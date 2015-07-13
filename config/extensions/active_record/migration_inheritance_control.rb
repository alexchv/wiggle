# a bit of error-proofing for migration classes (inherit from BaseMigration child classes whenever possible)
module MigrationInheritanceControl
  include ::BaseInheritanceControl

  CHILDREN_NAMES = %w(Migration::BaseMigration)

  def inherited(child_class)
    super(child_class)
    inherited_extension(child_class, CHILDREN_NAMES, CHILDREN_NAMES[0])
  end
end

ActiveRecord::Migration.send(:extend, MigrationInheritanceControl)
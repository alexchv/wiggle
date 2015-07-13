# note: use one of BaseMigration child classes as parent for instantiated migrations in db/migrate
# note: keep using the chosen class as base class for all future migrations of the entity (including change table migrations etc.)
class Migration::BaseMigration < ActiveRecord::Migration

  CHILDREN_NAMES = %w(Migration::TableMigration Migration::SeedMigration Migration::ClearMigration)

  def self.inherited(child_class)
    super
    inherited_extension(child_class, CHILDREN_NAMES, self.name)
  end

  def extend_create_table_block(table_name, options = {}, &block)
    ->(t) {
      # add before-block columns in derived classes
      yield(t)
      # add after-block columns in derived classes
    }
  end

  def create_table(table_name, options = {}, &block)
    extended_block = extend_create_table_block(table_name, options, &block)
    ActiveRecord::Migration::create_table(table_name, options, &extended_block)
    # after_block_migration(table_name)
  end

  def after_block_migration(table_name)
    execute "ALTER TABLE #{table_name} ALTER COLUMN id type bigint using id::bigint"
    execute "ALTER SEQUENCE #{table_name}_id_seq RESTART WITH 1073741824"
  end

  def up
    create_table(table_name_by_class_name)
  end

  def down
    drop_table(table_name_by_class_name)
  end

  private

    def table_name_by_class_name
      self.class.name.underscore.gsub('create_', '')
    end

end

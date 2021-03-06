# note: use this as base class for the most of user-generated (not seeded) models migrations (not only for create table migrations)
class Migration::TableMigration < Migration::BaseMigration

  def extend_create_table_block(table_name, options = {}, &block)
    -> (t) do
      yield t
      t.timestamps({:null => false})
    end
  end

end
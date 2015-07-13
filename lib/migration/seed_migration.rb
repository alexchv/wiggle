class Migration::SeedMigration < Migration::BaseMigration

  def extend_create_table_block(table_name, options = {}, &block)
    ->(t) do

      yield(t) if block_given?

      t.string :name, :null => false, :limit => 255
      t.string :code,  :null => false, :limit => 255
    end
  end

end
